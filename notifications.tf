resource "tfe_notification_configuration" "email" {
  workspace_id = tfe_workspace.this.id
  name         = "Send email"
  enabled      = true

  triggers = var.notifications_triggers

  destination_type = "email"
  email_user_ids   = var.email_notifications
}


resource "tfe_notification_configuration" "http" {
  for_each = var.http_notifications

  workspace_id = tfe_workspace.this.id
  name         = "HTTP to: ${each.value.name}"
  enabled      = true

  triggers = each.value.triggers

  destination_type = "generic"
  url              = each.value.url
}


