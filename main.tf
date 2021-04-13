locals {
  resource_level       = "PROJECT"
  project_id           = data.google_project.selected.project_id
  service_account_name = var.use_existing_service_account ? (
    var.service_account_name
    ) : (
    length(var.service_account_name) > 0 ? var.service_account_name : "${var.prefix}-lw-${random_id.uniq.hex}"
  )
  service_account_json_key = jsondecode(var.use_existing_service_account ? (
    base64decode(var.service_account_private_key)
    ) : (
    base64decode(module.lacework_gcr_svc_account.private_key)
  ))
  required_gcr_apis = {
    resourcemanager   = "cloudresourcemanager.googleapis.com"
    containerregistry = "containerregistry.googleapis.com"
  }
  gcr_apis  = local.required_gcr_apis
  gcr_roles = ["roles/storage.objectviewer"]
  current_roles = split("\n", data.external.gcloud_project_iam_check_output.result["roles"])
  required_roles = setsubtract(local.gcr_roles, local.current_roles)
}

resource "random_id" "uniq" {
  byte_length = 4
}

data "google_project" "selected" {
  project_id = var.project_id
}

module "lacework_gcr_svc_account" {
  source               = "lacework/service-account/gcp"
  version              = "~> 1.0"
  create               = var.use_existing_service_account ? false : true
  service_account_name = local.service_account_name
  project_id           = local.project_id
}

resource "google_project_service" "required_apis_for_gcr_integration" {
  for_each = local.gcr_apis
  project  = local.project_id
  service  = each.value

  disable_on_destroy = false
}

module "gcloud" {
  source  = "terraform-google-modules/gcloud/google"
  version = "~> 2.0"

  platform = "linux"
  additional_components = ["core"]
  skip_download = true
  upgrade = false

  create_cmd_entrypoint  = "gcloud"
  destroy_cmd_entrypoint = ""
  enabled = var.use_existing_service_account
}

data "external" "gcloud_project_iam_check_output" {
  program = ["/bin/bash", "-c", "response=$(${module.gcloud.create_cmd_bin} projects get-iam-policy ${local.project_id} --flatten='bindings[].members' --format='value(bindings.role)' --filter='${local.service_account_json_key.client_email}'); jq -n --arg v \"$response\" '{\"roles\": $v }'"]
  depends_on = [
    module.gcloud,
    module.lacework_gcr_svc_account
  ]
}

resource "google_project_iam_member" "for_gcr_integration" {
  for_each = local.required_roles
  project  = local.project_id
  role     = each.value
  member     = "serviceAccount:${local.service_account_json_key.client_email}"
  depends_on = [data.external.gcloud_project_iam_check_output]
}

# wait for X seconds for things to settle down in the GCP side
# before trying to create the Lacework external integration
resource "time_sleep" "wait_time" {
  create_duration = var.wait_time
  depends_on      = [
    google_project_service.required_apis_for_gcr_integration,
    google_project_iam_member.for_gcr_integration
  ]
}

resource "lacework_integration_gcr" "default" {
  name             = var.lacework_integration_name
  registry_domain  = var.registry_domain
  credentials {
    client_id      = local.service_account_json_key.client_id
    private_key_id = local.service_account_json_key.private_key_id
    client_email   = local.service_account_json_key.client_email
    private_key    = local.service_account_json_key.private_key
  }
  limit_by_tag     = var.limit_by_tag
  limit_by_label   = var.limit_by_label
  limit_by_repos   = var.limit_by_repos
  limit_num_imgs   = var.limit_num_imgs
  depends_on = [time_sleep.wait_time]
}
