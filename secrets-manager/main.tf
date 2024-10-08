// secrets-manager/main.tf

terraform {
  required_version = ">= 1.4.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.profile
}

# Crear el secreto en AWS Secrets Manager
resource "aws_secretsmanager_secret" "app_secrets" {
  name        = "${var.app_name}-${var.environment}-secrets"
  description = "Secrets for the ${var.environment} environment of the ${var.app_name} application."

  tags = {
    Environment = var.environment
    Company     = var.company_name
    AppName     = var.app_name
  }
}
