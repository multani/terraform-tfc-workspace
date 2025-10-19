resource "tfe_notification_configuration" "email" {
  # Not possible to enable email notifications with no users.
  count = length(var.email_notifications) > 0 ? 1 : 0

  workspace_id = tfe_workspace.this.id
  name         = "Send email"

  triggers = var.notifications_triggers

  destination_type = "email"
  email_user_ids   = var.email_notifications
}


resource "tfe_notification_configuration" "http" {
  for_each = toset(var.http_notifications)

  workspace_id = tfe_workspace.this.id
  name         = "HTTP to: ${each.value.name}"
  enabled      = true

  triggers = each.value.triggers

  destination_type = "generic"
  url              = each.value.url
}


