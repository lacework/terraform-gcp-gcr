locals {
  resource_level = "PROJECT"
  project_id     = length(var.project_id) > 0 ? var.project_id : data.google_project.selected.project_id
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
  gcr_apis = var.required_gcr_apis
}

resource "random_id" "uniq" {
  byte_length = 4
}

data "google_project" "selected" {}

module "lacework_gcr_svc_account" {
  source               = "lacework/service-account/gcp"
  version              = ">= 1.2.1"
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

// Role(s) for a GCR integration
resource "google_project_iam_member" "for_gcr_integration" {
  count = var.permission_on_bucket ? 0 : 1

  project = local.project_id
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:${local.service_account_json_key.client_email}"
}

// Ensures that the Google Cloud Storage bucket that backs Google Container Registry exists. Creating this resource will create the backing bucket if it does not exist, or do nothing if the bucket already exists. Destroying this resource does NOT destroy the backing bucket.
resource "google_container_registry" "registry" {
  count = var.permission_on_bucket ? 1 : 0

  project = local.project_id
  # gcr.io      -> null (default location)
  # eu.gcr.io   -> "EU"
  # us.gcr.io   -> "US"
  # asia.gcr.io -> "ASIA"
  location = var.registry_domain == "gcr.io" ? null : upper(trimsuffix(var.registry_domain, ".gcr.io"))
}

resource "google_storage_bucket_iam_member" "registry_read" {
  count = var.permission_on_bucket ? 1 : 0

  bucket = google_container_registry.registry.0.id
  role   = "roles/storage.objectViewer"
  member = format("serviceAccount:%s", local.service_account_json_key.client_email)
}

# wait for X seconds for things to settle down in the GCP side
# before trying to create the Lacework external integration
resource "time_sleep" "wait_time" {
  create_duration = var.wait_time
  depends_on = [
    module.lacework_gcr_svc_account,
    google_project_service.required_apis_for_gcr_integration,
    google_project_iam_member.for_gcr_integration,
    google_storage_bucket_iam_member.registry_read,
  ]
}

resource "lacework_integration_gcr" "default" {
  name            = var.lacework_integration_name
  registry_domain = var.registry_domain
  credentials {
    client_id      = local.service_account_json_key.client_id
    private_key_id = local.service_account_json_key.private_key_id
    client_email   = local.service_account_json_key.client_email
    private_key    = local.service_account_json_key.private_key
  }
  limit_by_tags          = var.limit_by_tags
  limit_by_repositories  = var.limit_by_repositories
  limit_num_imgs         = var.limit_num_imgs
  non_os_package_support = var.non_os_package_support

  dynamic "limit_by_label" {
    for_each = var.limit_by_labels
    content {
      key     = limit_by_label.value.key
      value   = limit_by_label.value.value
    }
  }
  depends_on = [time_sleep.wait_time]
}
