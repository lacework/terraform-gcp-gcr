provider "lacework" {}

provider "google" {}

module "lacework_gcr" {
  source = "../.."
}
