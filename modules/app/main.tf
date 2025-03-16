// Start of file: /modules/app/main.tf

terraform {
  required_version = ">= 1.4.0"
}
provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}
resource "aws_secretsmanager_secret" "app_secrets" {
  name        = "${var.environment}-${var.app_name}-secrets"
  description = "Secrets for the ${var.environment} environment of the ${var.app_name} app."
  tags = {
    Environment = var.environment
    Company     = var.company_name
    AppName     = var.app_name
  }
}

// End of file: /modules/app/main.tf
