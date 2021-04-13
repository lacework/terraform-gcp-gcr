output "service_account_name" {
  value       = local.service_account_name
  description = "The Service Account name"
}

output "service_account_private_key" {
  value       = length(var.service_account_private_key) > 0 ? var.service_account_private_key : module.lacework_gcr_svc_account.private_key
  description = "The private key in JSON format, base64 encoded"
}

output "current_roles" {
  value = local.current_roles
}

output "required_roles" {
  value = local.required_roles
}