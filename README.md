# terraform-google-workload-identity-federation

Terraform module to to configure [workload identity federation](https://cloud.google.com/iam/docs/workload-identity-federation) for OIDC on GCP.

## Purpose

Traditionally, applications running outside Google Cloud have used long-lived JSON service account keys to access Google Cloud resources. Service account keys are powerful credentials and can represent a security risk if they are not managed correctly.

Benefits of identity federation include:

* Fine-grained scoping
* Short-lived credentials
* Minimal management overhead

Identity federation also allows the use of service accounts for authentication when key creation is disabled via organization policy constraints like `constraints/iam.disableServiceAccountKeyCreation`.

## Requirements

Required APIs & Services:

* `cloudresourcemanager.googleapis.com`
* `iam.googleapis.com`
* `iamcredentials.googleapis.com`
* `sts.googleapis.com`

## Usage

```hcl
```

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | -------- |
| project_id | The ID of the project | `string` | n/a | yes
| pool_id | Workload Identity Pool ID | `string` | n/a | yes
| pool_display_name | Workload Identity Pool display name | `string` | `null` | no
| pool_description | Workload Identity Pool description | `string` | `"Workload Identity Pool managed by Terraform"` | no
| pool_disabled | Workload Identity Pool disabled | `bool` | `false` | no
| provider_id | Workload Identity Pool Provider ID | `string` | n/a | yes
| provider_display_name | Workload Identity Pool Provider display name | `string` | `null` | no
| provider_description | Workload Identity Pool Provider description | `string` | `"Workload Identity Pool Provider managed by Terraform"` | no
| provider_disabled | Workload Identity Pool Provider disabled | `bool` | `false` | no
| attribute_mapping | Workload Identity Pool Provider attribute mapping | `map(any)` | `{}` | no
| attribute_condition | Workload Identity Pool Provider attribute condition expression | `string` | `null` | no
| allowed_audiences | Workload Identity Pool Provider allowed audiences | `list(string)` | `[]` | no
| issuer_uri | Workload Identity Pool Provider issuer URL | `string` | n/a | yes
| service_accounts | Service Account resource names and corresponding provider attributes | <pre>list(object({<br>  name           = string<br>  attribute      = string<br>  all_identities = bool<br>}))</pre> | `null` | no

## Outputs

| Name | Description |
| ---- | ----------- |
| pool_id | Identifier for the pool |
| pool_state | State of the pool |
| pool_name | Name for the pool |
| provider_id | Identifier for the provider |
| provider_state | State of the provider |
| provider_name | Name for the provider |