output "user_name" {
  value       = local.username
  description = "Normalized IAM user name"
}

output "user_arn" {
  value       = aws_iam_user.this.arn
  description = "The ARN assigned by AWS for this user"
}

output "user_unique_id" {
  value       = aws_iam_user.this.unique_id
  description = "The unique ID assigned by AWS"
}

output "sm_enabled" {
  value       = var.sm_enabled
  description = "`true` when secrets are stored in Secret Manager, `false` when secrets are stored in Terraform state as outputs."
}

output "access_key_id" {
  value       = var.create_iam_access_key ? aws_iam_access_key.this[0].id : null
  description = "The access key ID"
}

output "secret_access_key" {
  sensitive   = true
  value       = var.sm_enabled ? null : aws_iam_access_key.this[0].secret
  description = <<-EOT
When `sm_enabled` is `false`, this is the secret access key for the IAM user.
This will be written to the state file in plain-text.
When `sm_enabled` is `true`, this output will be empty to keep the value secure.
EOT
}

output "ses_smtp_password_v4" {
  sensitive   = true
  value       = var.sm_enabled ? null : aws_iam_access_key.this[0].ses_smtp_password_v4
  description = <<-EOT
When `sm_enabled` is false, this is the secret access key converted into an SES SMTP password
by applying AWS's Sigv4 conversion algorithm. It will be written to the Terraform state file in plaintext.
When `sm_enabled` is `true`, this output will be empty to keep the value secure.
EOT
}

output "secret_arn" {
  value       = var.sm_enabled ? module.secret_iam[0].arn : null
  description = "Secret Manager ARN under which the IAM User's access and private key ID is stored"
}
