// Start of file: /env/dev/outputs.tf

output "secret_arn" {
  description = "ARN from the app module"
  value       = module.app.secret_arn
}

// End of file: /env/dev/outputs.tf
