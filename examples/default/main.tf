provider "lacework" {}

provider "google" {}

module "lacework_gcr" {
  source = "../.."
  non_os_package_support = true
}
