variable "required_gcr_apis" {
  type = map(any)
  default = {
    resourcemanager   = "cloudresourcemanager.googleapis.com"
    containerregistry = "containerregistry.googleapis.com"
  }
}

variable "project_id" {
  type        = string
  default     = ""
  description = "A project ID different from the default defined inside the provider"
}

variable "use_existing_service_account" {
  type        = bool
  default     = false
  description = "Set this to true to use an existing Service Account. When using an existing service account, the required roles must be added manually."
}

variable "service_account_name" {
  type        = string
  default     = ""
  description = "The Service Account name (required when use_existing_service_account is set to true). This can also be used to specify the new service account name when use_existing_service_account is set to false"
}

variable "service_account_private_key" {
  type        = string
  default     = ""
  description = "The private key in JSON format, base64 encoded (required when use_existing_service_account is set to true)"
}

variable "prefix" {
  type        = string
  default     = "lw-gcr"
  description = "The prefix that will be use at the beginning of every generated resource"
}

variable "lacework_integration_name" {
  type        = string
  default     = "TF GCR"
  description = "The integration name displayed in the Lacework UI."
}

variable "wait_time" {
  type        = string
  default     = "10s"
  description = "Amount of time to wait before the next resource is provisioned."
}

variable "registry_domain" {
  type        = string
  default     = "gcr.io"
  description = "The GCR domain, which specifies the location where you store the images. Supported domains are gcr.io, us.gcr.io, eu.gcr.io, or asia.gcr.io. Defaults to gcr.io."
}

variable "limit_by_tags" {
  type        = list(string)
  default     = []
  description = "A list of tags to limit the assessment of images with matching tags. If you specify limit_by_tags and limit_by_label limits, they function as an AND."
}

variable "limit_by_labels" {
  type        = map(string)
  default     = {}
  description = "A key based map of image labels to limit the assessment of images with matching labels. If you specify limit_by_tags and limit_by_label limits, they function as an AND."
}

variable "limit_by_repositories" {
  type        = list(string)
  default     = []
  description = "A list of repositories to assess"
}

variable "limit_num_imgs" {
  type        = string
  default     = "5"
  description = "The maximum number of newest container images to assess per repository. Must be one of 5, 10, or 15. Defaults to 5."
}

variable "non_os_package_support" {
  type        = bool
  default     = true
  description = "Whether or not the integration should check non-os packages in the container for vulnerabilities.  Defaults to true"
}
