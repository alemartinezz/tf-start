// Start of file: /env/prod/variables.tf

variable "aws_region" {
  type        = string
  description = "AWS region para prod"
}
variable "aws_profile" {
  type        = string
  description = "AWS CLI profile para prod"
}
variable "environment" {
  type        = string
  description = "Nombre del entorno (p. ej. prod)"
  default     = "prod"
}
variable "company_name" {
  type        = string
  description = "Nombre de la empresa"
}
variable "app_name" {
  type        = string
  description = "Nombre de la aplicación"
}

// End of file: /env/prod/variables.tf
