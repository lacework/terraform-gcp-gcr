provider "google" {}

provider "lacework" {}

module "lacework_gcr" {
  source = "../../"

  # configure the lacework container registry integration
  lacework_integration_name = "Example GCR integration"
  registry_domain           = "us.gcr.io"
  limit_by_tag              = "example*"
  limit_by_label            = "example*"
  limit_by_repos            = "foo,bar"
  limit_num_imgs            = "10"
}
