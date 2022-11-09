terraform {
  required_version = ">= 0.14"

  required_providers {
    google = ">= 3.0.0, < 4.41.0"
    time   = "~> 0.6"
    lacework = {
      source  = "lacework/lacework"
      version = "~> 1.0"
    }
  }
}
