# Terraform module to manage Terraform Cloud workspace

This is a personal (opiniated) Terraform module to manage my [Terraform Cloud
workspaces](https://developer.hashicorp.com/terraform/cloud-docs/workspaces).

## How to use?

```hcl
module "test" {
  source  = "multani/workspace/tfc"
  version = "1.0.0"

  name         = "test"
  organization = data.tfe_organization.this.id

  terraform_version = "1.7.4"

  vcs_repos_name     = "multani/tf-test"
  vcs_oauth_token_id = data.tfe_oauth_client.github.oauth_token_id
}
```
