# Environment Variables for Project Level Config
The following provides an example of integrating a Google Cloud Project with Lacework and configuring the Terraform Provider for Google and the Terraform Provider for Lacework using environment variables.

```hcl
terraform {
  required_providers {
    lacework = {
      source = "lacework/lacework"
    }
  }
}

// This template assumes the default configuration coming from the following
// environment variables:
//
// For Google's Provider:
//
// 1) GOOGLE_CREDENTIALS
// 2) GOOGLE_PROJECT
//
// For Lacework's Provider:
//
// 1) LW_ACCOUNT
// 2) LW_API_KEY
// 3) LW_API_SECRET
//
// Example of how to run this code:
//
// $ terraform init
// $ GOOGLE_CREDENTIALS=account.json \
//   GOOGLE_PROJECT=my-project       \
//   LW_ACCOUNT=my-account           \
//   LW_API_KEY=ACCOUNT_1234         \
//   LW_API_SECRET=_abcde123         \
//   terraform apply
provider "google" {}

provider "lacework" {}

module "lacework_gcr" {
  source  = "lacework/gcr/gcp"
  version = "~> 1.0"
  non_os_package_support = true
}
```

For detailed information on integrating Lacework with Google Container Registry see [Integrate Google Container Registry](https://docs.lacework.com/integrate-google-container-registry)
