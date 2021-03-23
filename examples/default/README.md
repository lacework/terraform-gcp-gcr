# Default Lacework GCR Integration

This example creates a new least privilege service account to access the Google Container Registry of the project configured in the automationan and integrates it with Lacework.

```hcl
terraform {
  required_providers {
    lacework = {
      source = "lacework/lacework"
    }
  }
}

provider "lacework" {}

provider "google" {}

module "lacework_gcr" {
  source  = "lacework/gcr/gcp"
  version = "~> 0.1"
}
```
