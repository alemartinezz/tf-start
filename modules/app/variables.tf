// Start of file: /modules/app/variables.tf

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
variable "company_name" {
  type        = string
  description = "Company name."
}
variable "app_name" {
  type        = string
  description = "Application name."
}

// End of file: /modules/app/variables.tf
