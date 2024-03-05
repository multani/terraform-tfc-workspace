# Terraform module to manage Terraform Cloud workspace

This is a personal (opiniated) Terraform module to manage my Terraform Cloud workspaces.

## How to use?

```hcl
module "test" {
  source  = "app.terraform.io/multani/workspace/tfc"
  version = "0.9.0"

  name         = "test"
  organization = data.tfe_organization.this.id

  terraform_version = "1.7.4"

  vcs_repos_name     = "multani/tf-test"
  vcs_oauth_token_id = data.tfe_oauth_client.github.oauth_token_id
}
```
