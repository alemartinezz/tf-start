# variables.tf

variable "aws_region" {
  description = "AWS region where resources will be created."
  type        = string
}

variable "profile" {
  description = "AWS CLI profile to use."
  type        = string
}

variable "project_name" {
  description = "Name of the project."
  type        = string
}

variable "account_id" {
  description = "Name of the project."
  type        = string
}
