variable "name" {
  description = "The name of the workspace"
  type        = string
}

variable "organization" {
  description = "The Terraform Cloud organization"
  type        = string
}

variable "execution_mode" {
  default = "remote"
  type    = string
}

variable "terraform_version" {
  type = string
}

variable "directory" {
  type    = string
  default = ""

  validation {
    condition = (
      var.directory == "" ||
      (
        startswith(var.directory, "/") &&
        length(var.directory) > 2
      )
    )
    error_message = "Directory should be either empty or a directory starting with /"
  }
}

variable "vcs_repos_name" {
  type = string
}

variable "vcs_repos_branch" {
  default = "main"
  type    = string
}

variable "trigger_patterns" {
  type    = list(string)
  default = []
}

variable "vcs_oauth_token_id" {
  type      = string
  sensitive = true
}

variable "email_notifications" {
  type    = list(string)
  default = []
}

variable "auto_apply" {
  type    = bool
  default = false
}

variable "notifications_triggers" {
  type = list(string)
  default = [
    "run:needs_attention",
    "run:errored",
  ]
}

variable "variable_sets" {
  type    = map(string)
  default = {}
}

variable "tags" {
  type    = list(string)
  default = []
}

variable "project_id" {
  default = null
  type    = string
}
