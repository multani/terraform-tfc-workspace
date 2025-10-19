resource "tfe_workspace" "this" {
  name = var.name

  organization = var.organization
  project_id   = var.project_id

  terraform_version = var.terraform_version

  trigger_patterns = concat(
    # https://developer.hashicorp.com/terraform/cloud-docs/workspaces/settings/vcs#glob-patterns-for-automatic-run-triggering
    [
      # /**/* matches every file in every directory
      "${var.directory}/**/*",
    ],
    var.trigger_patterns,
  )
  working_directory = var.directory

  vcs_repo {
    identifier = var.vcs_repos_name
    branch     = var.vcs_repos_branch

    oauth_token_id             = var.vcs_oauth_token_id
    github_app_installation_id = var.vcs_github_app_installation_id
  }

  auto_apply     = var.auto_apply
  queue_all_runs = false

  tag_names = var.tags
}

resource "tfe_workspace_settings" "this" {
  workspace_id   = tfe_workspace.this.id
  execution_mode = var.execution_mode
}
