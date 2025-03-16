// Start of file: /env/stg/variables.tf

variable "aws_region" {
  type        = string
  description = "AWS region para el entorno stg"
}
variable "aws_profile" {
  type        = string
  description = "AWS CLI profile para el entorno stg"
}
variable "environment" {
  type        = string
  description = "Nombre del entorno (p. ej. stg)"
  default     = "stg"
}
variable "company_name" {
  type        = string
  description = "Nombre de la empresa"
}
variable "app_name" {
  type        = string
  description = "Nombre de la aplicación"
}

// End of file: /env/stg/variables.tf
