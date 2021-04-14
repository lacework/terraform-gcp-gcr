terraform {
  required_version = ">= 0.12.26"

  required_providers {
    google = "~> 3.0"
    lacework = {
      source = "lacework/lacework"
    }
  }
}
