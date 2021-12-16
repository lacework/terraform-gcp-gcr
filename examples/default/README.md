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
  version = "~> 1.0"
  non_os_package_support = true
}
```

For detailed information on integrating Lacework with Google Container Registry see [Integrate Google Container Registry](https://docs.lacework.com/integrate-google-container-registry)

