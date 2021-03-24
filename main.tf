locals {
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
  default_gcr_roles = [
    "roles/storage.objectViewer"
  ]
  required_gcr_apis = {
    containerregistry = "containerregistry.googleapis.com"
  }
  gcr_roles = local.default_gcr_roles
  gcr_apis  = local.required_gcr_apis
}

resource "random_id" "uniq" {
  byte_length = 4
}

data "google_project" "selected" {
  project_id = local.project_id
}

module "lacework_gcr_svc_account" {
  source               = "lacework/service-account/gcp"
  version              = "~> 0.1.0"
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
  for_each = toset(local.gcr_roles)
  project  = local.project_id
  role     = each.value
  member   = "serviceAccount:${local.service_account_json_key.client_email}"
}
