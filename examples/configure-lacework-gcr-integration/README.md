# Configure the Lacework GCR integration

This example shows how create a configured Google Cloud Project integration with Lacework.

The fields required for this example are:

| Name | Description | Type |
|------|-------------|------|
| `lacework_integration_name` | Set this to whatever you would like the integration to be named. | `string` |
| `registry_domain` | The GCR domain, which specifies the location where you store the images. Supported domains are gcr.io, us.gcr.io, eu.gcr.io, or asia.gcr.io. Defaults to gcr.io. | `string` |
| `limit_by_tags` |A list of image tags to limit the assessment of images with matching tags. If you specify limit_by_tags and limit_by_labels limits, they function as an AND. Supported field input can be ["mytext\*mytext", "mytext", "mytext\*", "mytext". Only one * wildcard is supported.| `list(string)` |
| `limit_by_labels` |A list of image labels to limit the assessment of images with matching labels. If you specify limit_by_tags and limit_by_labels limits, they function as an AND. Supported field input can be ["mytext\*mytext", "mytext", "mytext*", "mytext"].Only one * wildcard is supported.| `list(string)` |
| `limit_by_repositories` |A list of repositories to assess.| `list(string)` |
| `limit_num_imgs` | The maximum number of newest container images to assess per repository. Must be one of 5, 10, or 15. Defaults to 5. | `string` |
| `non_os_package_support` |Whether or not the integration should check non-os packages in the container for vulnerabilities. Defaults to false. | `bool` |


Create a `main.tf` with the following code:

```hcl
provider "google" {}

provider "lacework" {}

module "lacework_svc_account" {
  source  = "lacework/gcr/gcp"
  version = "~> 1.0"
  
  lacework_integration_name = "Example GCR integration"
  registry_domain           = "us.gcr.io"
  limit_by_tags             = ["example*"]
  limit_by_labels           = {example: "example*"}
  limit_by_repositories     = ["foo", "bar"]
  limit_num_imgs            = "10"
  non_os_package_support    = true
}
```

Run Terraform:
```
$ terraform init
$ GOOGLE_CREDENTIALS=account.json GOOGLE_PROJECT=my-project terraform apply
```

For detailed information on integrating Lacework with Google Container Registry see [Integrate Google Container Registry](https://docs.lacework.com/integrate-google-container-registry)
