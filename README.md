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

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
|project_id|A project ID different from the default defined inside the provider|string|""|false|
|use_existing_service_account|Set this to true to use an existing Service Account. When using an existing service account, the required roles must be added manually.|bool|false|false|
|service_account_name|The Service Account name (required when use_existing_service_account is set to true). This can also be used to specify the new service account name when use_existing_service_account is set to false|string|""|false|
|service_account_private_key|The private key in JSON format, base64 encoded (required when use_existing_service_account is set to true)|string|""|false|
|prefix|The prefix that will be use at the beginning of every generated resource|string|lw-gcr|false|
|lacework_integration_name|The integration name displayed in the Lacework UI.|string|TF GCR|false|
|wait_time|Amount of time to wait before the next resource is provisioned.|string|10s|false|
|registry_domain|The GCR domain, which specifies the location where you store the images. Supported domains are gcr.io, us.gcr.io, eu.gcr.io, or asia.gcr.io.|string|gcr.io|false|
|limit_by_tags|A list of image tags to limit the assessment of images with matching tags. If you specify limit_by_tags and limit_by_labels limits, they function as an AND. Supported field input can be ["mytext\*mytext", "mytext", "mytext\*", "mytext". Only one * wildcard is supported.|list(string)|*|false|
|limit_by_labels|A list of image labels to limit the assessment of images with matching labels. If you specify limit_by_tags and limit_by_labels limits, they function as an AND. Supported field input can be ["mytext\*mytext", "mytext", "mytext*", "mytext"].Only one * wildcard is supported.|list(string)|*|false|
|limit_by_repositories|A list of repositories to assess.|list(string)|""|false|
|limit_num_imgs|The maximum number of newest container images to assess per repository. Must be one of 5, 10, or 15.|string|5|false|
|non_os_package_support|Whether or not the integration should check non-os packages in the container for vulnerabilities. Defaults to false. |bool|false|false|

## Outputs

| Name | Description |
|------|-------------|
|service_account_name|The Service Account name|
|service_account_private_key|The private key in JSON format, base64 encoded|
