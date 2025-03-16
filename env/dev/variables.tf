// Start of file: /env/dev/variables.tf

variable "aws_region" {
  type        = string
  description = "AWS region for dev environment"
}
variable "aws_profile" {
  type        = string
  description = "AWS CLI profile for dev environment"
}
variable "environment" {
  type        = string
  description = "Environment name (e.g., dev, staging, production)."
  default     = "dev"
}
variable "company_name" {
  type        = string
  description = "Company name."
}
variable "app_name" {
  type        = string
  description = "Application name."
}

// End of file: /env/dev/variables.tf
