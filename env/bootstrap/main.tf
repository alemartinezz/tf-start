// Start of file: /env/bootstrap/main.tf

terraform {
  required_version = ">= 1.4.0"
  backend "local" {
    path = "terraform.tfstate"
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

module "backend" {
  source       = "../../modules/backend"
  aws_region   = var.aws_region
  aws_profile  = var.aws_profile
  environment  = var.environment
  project_name = var.project_name
  account_id   = var.account_id
  iam_user     = var.iam_user
}

output "s3_bucket_id" {
  description = "S3 bucket for Terraform state, created in bootstrap."
  value       = module.backend.s3_bucket_id
}

output "dynamodb_table_name" {
  description = "DynamoDB table for Terraform locking."
  value       = module.backend.dynamodb_table_name
}

// End of file: /env/bootstrap/main.tf
