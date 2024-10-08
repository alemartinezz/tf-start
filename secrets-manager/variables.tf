// secrets-manager/variables.tf

variable "aws_region" {
  description = "AWS region where resources will be created."
  type        = string
}

variable "profile" {
  description = "AWS CLI profile to use."
  type        = string
}

variable "environment" {
  description = "Environment name (e.g., staging, production)."
  type        = string
}

variable "company_name" {
  description = "Company name."
  type        = string
}

variable "app_name" {
  description = "Application name."
  type        = string
}
