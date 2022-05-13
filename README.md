<a href="https://lacework.com"><img src="https://techally-content.s3-us-west-1.amazonaws.com/public-content/lacework_logo_full.png" width="600"></a>

# terraform-gcp-gcr

[![GitHub release](https://img.shields.io/github/release/lacework/terraform-gcp-gcr.svg)](https://github.com/lacework/terraform-gcp-gcr/releases/)
[![Codefresh build status]( https://g.codefresh.io/api/badges/pipeline/lacework/terraform-modules%2Ftest-compatibility?type=cf-1&key=eyJhbGciOiJIUzI1NiJ9.NWVmNTAxOGU4Y2FjOGQzYTkxYjg3ZDEx.RJ3DEzWmBXrJX7m38iExJ_ntGv4_Ip8VTa-an8gBwBo)]( https://g.codefresh.io/pipelines/edit/new/builds?id=607e25e6728f5a6fba30431b&pipeline=test-compatibility&projects=terraform-modules&projectId=607db54b728f5a5f8930405d)

A Terraform Module to integrate Google Container Registries (GCR) with Lacework.

:warning: - **NOTE:** When using an existing Service Account, Terraform cannot work out whether a role has already been applied.
This means when running the destroy step, existing roles may be removed from the Service Account. If this Service Account
is managed by  another Terraform module, you can re-run apply on the other module and this will re-add the role.

Alternatively, it is possible to remove the offending roles from the state file before destroy, preventing the role(s)
from being removed.

e.g. `terraform state rm 'google_project_iam_binding.for_lacework_service_account'`

## Required Roles

```
roles/storage.objectViewer
```

## Required APIs

```
cloudresourcemanager.googleapis.com
containerregistry.googleapis.com
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.0.0, < 5.0.0 |
| <a name="requirement_lacework"></a> [lacework](#requirement\_lacework) | ~> 0.3 |
| <a name="requirement_time"></a> [time](#requirement\_time) | ~> 0.6 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 3.0.0, < 5.0.0 |
| <a name="provider_lacework"></a> [lacework](#provider\_lacework) | ~> 0.3 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |
| <a name="provider_time"></a> [time](#provider\_time) | ~> 0.6 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_lacework_gcr_svc_account"></a> [lacework\_gcr\_svc\_account](#module\_lacework\_gcr\_svc\_account) | lacework/service-account/gcp | ~> 1.0 |

## Resources

| Name | Type |
|------|------|
| [google_container_registry.registry](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_registry) | resource |
| [google_project_iam_member.for_gcr_integration](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_service.required_apis_for_gcr_integration](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_storage_bucket_iam_member.registry_read](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam_member) | resource |
| [lacework_integration_gcr.default](https://registry.terraform.io/providers/lacework/lacework/latest/docs/resources/integration_gcr) | resource |
| [random_id.uniq](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [time_sleep.wait_time](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [google_project.selected](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_lacework_integration_name"></a> [lacework\_integration\_name](#input\_lacework\_integration\_name) | The integration name displayed in the Lacework UI. | `string` | `"TF GCR"` | no |
| <a name="input_limit_by_labels"></a> [limit\_by\_labels](#input\_limit\_by\_labels) | A key based map of image labels to limit the assessment of images with matching labels. If you specify limit\_by\_tags and limit\_by\_label limits, they function as an AND. | `map(string)` | `{}` | no |
| <a name="input_limit_by_repositories"></a> [limit\_by\_repositories](#input\_limit\_by\_repositories) | A list of repositories to assess | `list(string)` | `[]` | no |
| <a name="input_limit_by_tags"></a> [limit\_by\_tags](#input\_limit\_by\_tags) | A list of tags to limit the assessment of images with matching tags. If you specify limit\_by\_tags and limit\_by\_label limits, they function as an AND. | `list(string)` | `[]` | no |
| <a name="input_limit_num_imgs"></a> [limit\_num\_imgs](#input\_limit\_num\_imgs) | The maximum number of newest container images to assess per repository. Must be one of 5, 10, or 15. Defaults to 5. | `string` | `"5"` | no |
| <a name="input_non_os_package_support"></a> [non\_os\_package\_support](#input\_non\_os\_package\_support) | Whether or not the integration should check non-os packages in the container for vulnerabilities.  Defaults to true | `bool` | `true` | no |
| <a name="input_permission_on_bucket"></a> [permission\_on\_bucket](#input\_permission\_on\_bucket) | Set roles/storage.objectViewer on the bucket level instead of the project | `bool` | `false` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | The prefix that will be use at the beginning of every generated resource | `string` | `"lw-gcr"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | A project ID different from the default defined inside the provider | `string` | `""` | no |
| <a name="input_registry_domain"></a> [registry\_domain](#input\_registry\_domain) | The GCR domain, which specifies the location where you store the images. Supported domains are gcr.io, us.gcr.io, eu.gcr.io, or asia.gcr.io. Defaults to gcr.io. | `string` | `"gcr.io"` | no |
| <a name="input_required_gcr_apis"></a> [required\_gcr\_apis](#input\_required\_gcr\_apis) | n/a | `map(any)` | <pre>{<br>  "containerregistry": "containerregistry.googleapis.com",<br>  "resourcemanager": "cloudresourcemanager.googleapis.com"<br>}</pre> | no |
| <a name="input_service_account_name"></a> [service\_account\_name](#input\_service\_account\_name) | The Service Account name (required when use\_existing\_service\_account is set to true). This can also be used to specify the new service account name when use\_existing\_service\_account is set to false | `string` | `""` | no |
| <a name="input_service_account_private_key"></a> [service\_account\_private\_key](#input\_service\_account\_private\_key) | The private key in JSON format, base64 encoded (required when use\_existing\_service\_account is set to true) | `string` | `""` | no |
| <a name="input_use_existing_service_account"></a> [use\_existing\_service\_account](#input\_use\_existing\_service\_account) | Set this to true to use an existing Service Account. When using an existing service account, the required roles must be added manually. | `bool` | `false` | no |
| <a name="input_wait_time"></a> [wait\_time](#input\_wait\_time) | Amount of time to wait before the next resource is provisioned. | `string` | `"10s"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_account_name"></a> [service\_account\_name](#output\_service\_account\_name) | The Service Account name |
| <a name="output_service_account_private_key"></a> [service\_account\_private\_key](#output\_service\_account\_private\_key) | The private key in JSON format, base64 encoded |
