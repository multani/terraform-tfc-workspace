resource "tfe_workspace_variable_set" "this" {
  for_each = var.variable_sets

  workspace_id    = tfe_workspace.this.id
  variable_set_id = each.value
}
