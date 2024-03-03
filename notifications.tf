resource "tfe_notification_configuration" "email" {
  workspace_id = tfe_workspace.this.id
  name         = "Send email"
  enabled      = true

  triggers = var.notifications_triggers

  destination_type = "email"
  email_user_ids   = var.email_notifications
}
