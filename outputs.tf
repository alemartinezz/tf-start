# outputs.tf

output "s3_bucket_id" {
  description = "ID of the S3 bucket for Terraform state."
  value       = aws_s3_bucket.terraform_state.id
}

output "s3_bucket_arn" {
  description = "ARN of the S3 bucket for Terraform state."
  value       = aws_s3_bucket.terraform_state.arn
}

output "dynamodb_table_name" {
  description = "Name of the DynamoDB table for Terraform locking."
  value       = aws_dynamodb_table.terraform_lock.name
}
