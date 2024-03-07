variable "name" {
  type        = string
  description = "Name of the created user."
}

variable "path" {
  type        = string
  default     = "/"
  description = "Path in which to create the user."
}

variable "force_destroy" {
  type        = bool
  default     = false
  description = "Destroy the user even if it has non-Terraform-managed IAM access keys, login profile or MFA devices."
}

variable "inline_policies" {
  type        = list(string)
  default     = []
  description = "Inline policies to attach to our created user."
}

variable "inline_policies_map" {
  type        = map(string)
  default     = {}
  description = "Inline policies to attach (descriptive key => policy)."
}

variable "policy_arns" {
  type        = list(string)
  default     = []
  description = "Policy ARNs to attach to our created user."
}

variable "policy_arns_map" {
  type        = map(string)
  default     = {}
  description = "Policy ARNs to attach (descriptive key => arn)."
}

variable "permissions_boundary" {
  type        = string
  default     = null
  description = "Permissions Boundary ARN to attach to our created user."
}

variable "create_iam_access_key" {
  type        = bool
  default     = true
  description = "Whether or not to create IAM access keys."
}

variable "sm_enabled" {
  type        = bool
  default     = true
  description = <<-EOT
Set `true` to store secrets in AWS Secret Manager, `
false` to store secrets in Terraform state as outputs.
Since Terraform state would contain the secrets in plaintext,
use of AWS Secret Manager is recommended.
EOT
}

variable "sm_ses_smtp_password_enabled" {
  type        = bool
  default     = false
  description = "Whether or not to create an SES SMTP password."
}

variable "sm_base_path" {
  type        = string
  default     = "/system_user/"
  description = "The base path for AWS Secret Manager parameters where secrets are stored."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Resource tags."
}
