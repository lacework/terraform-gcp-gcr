provider "google" {}

provider "lacework" {}

module "lacework_gcr" {
  source = "../../"

  # configure the lacework container registry integration
  lacework_integration_name = "Example GCR integration"
  registry_domain           = "us.gcr.io"
  limit_by_tags             = ["example*"]
  limit_by_labels           = {example: "example"}
  limit_by_repositories     = ["foo","bar"]
  limit_num_imgs            = "10"
  non_os_package_support    = true
}
