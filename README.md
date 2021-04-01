<a href="https://lacework.com"><img src="https://techally-content.s3-us-west-1.amazonaws.com/public-content/lacework_logo_full.png" width="600"></a>

# terraform-aws-gcr

[![GitHub release](https://img.shields.io/github/release/lacework/terraform-aws-gcr.svg)](https://github.com/lacework/terraform-aws-gcr/releases/)
[![CircleCI status](https://circleci.com/gh/lacework/terraform-aws-gcr.svg?style=shield)](https://circleci.com/gh/lacework/terraform-aws-gcr)

A Terraform Module to integrate Google Container Registries (GCR) with Lacework.

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
|limit_by_tag|An image tag to limit the assessment of images with matching tag. If you specify limit_by_tag and limit_by_label limits, they function as an AND. Supported field input are mytext*mytext, mytext, mytext*, or mytext. Only one * wildcard is supported.|string|*|false|
|limit_by_label|An image label to limit the assessment of images with matching label. If you specify limit_by_tag and limit_by_label limits, they function as an AND. Supported field input are mytext*mytext, mytext, mytext*, or mytext. Only one * wildcard is supported.|string|*|false|
|limit_by_repos|A comma-separated list of repositories to assess. This should be defined as a string. (without spaces recommended)|string|""|false|
|limit_num_imgs|The maximum number of newest container images to assess per repository. Must be one of 5, 10, or 15.|string|5|false|

## Outputs

| Name | Description |
|------|-------------|
|service_account_name|The Service Account name|
|service_account_private_key|The private key in JSON format, base64 encoded|