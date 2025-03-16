// Start of file: /modules/backend/variables.tf

variable "aws_region" {
  type        = string
  description = "AWS region where resources will be created."
}
variable "aws_profile" {
  type        = string
  description = "AWS CLI profile to use."
}
variable "environment" {
  type        = string
  description = "Environment name (e.g., dev, staging, production)."
}
variable "project_name" {
  type        = string
  description = "Name of the project."
}
variable "account_id" {
  type        = string
  description = "AWS Account ID."
}
variable "iam_user" {
  type        = string
  description = "Name of the IAM user for bucket access."
  default     = ""
}

// End of file: /modules/backend/variables.tf
