// Start of file: /env/stg/main.tf

terraform {
  required_version = ">= 1.4.0"
  backend "s3" {
    # Cambia "my-project-terraform-state" al bucket real que creaste
    bucket         = "my-project-terraform-state"
    # Cambia la ruta "stg/terraform.tfstate" si prefieres otra
    key            = "stg/terraform.tfstate"
    region         = "us-east-1"
    # Cambia "my-project-terraform-lock" si tu tabla se llama distinto
    dynamodb_table = "my-project-terraform-lock"
  }
}
provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}
module "app" {
  source       = "../../modules/app"
  aws_region   = var.aws_region
  aws_profile  = var.aws_profile
  environment  = var.environment
  company_name = var.company_name
  app_name     = var.app_name
}
output "secret_arn" {
  description = "ARN del secreto de Secrets Manager en staging"
  value       = module.app.secret_arn
}

// End of file: /env/stg/main.tf
