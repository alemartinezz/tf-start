// Start of file: /env/bootstrap/variables.tf

variable "aws_region" {
  type        = string
  description = "AWS region for the bootstrap environment"
}
variable "aws_profile" {
  type        = string
  description = "AWS CLI profile for the bootstrap environment"
}
variable "environment" {
  type        = string
  description = "Environment name, e.g. 'bootstrap'"
  default     = "bootstrap"
}
variable "project_name" {
  type        = string
  description = "Project name for bootstrap"
}
variable "account_id" {
  type        = string
  description = "AWS account ID"
}
variable "iam_user" {
  type        = string
  description = "Name of the IAM user for bucket access"
  default     = ""
}

// End of file: /env/bootstrap/variables.tf
