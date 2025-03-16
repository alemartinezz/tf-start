// Start of file: /env/dev/main.tf

terraform {
  required_version = ">= 1.4.0"
  # AFTER bootstrap is done, fill in the correct bucket + table here
  backend "s3" {
    bucket         = "my-project-terraform-state"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
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
  description = "ARN of the Secrets Manager secret from the app module."
  value       = module.app.secret_arn
}

// End of file: /env/dev/main.tf
