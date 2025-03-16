// Start of file: /modules/backend/main.tf

terraform {
  required_version = ">= 1.4.0"
}
provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}
resource "aws_s3_bucket" "terraform_state" {
  bucket = "${var.project_name}-terraform-state"
  tags = {
    Name        = "${var.project_name}-terraform-state"
    Environment = var.environment
  }
}
resource "aws_s3_bucket_versioning" "terraform_state_versioning" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}
resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state_encryption" {
  bucket = aws_s3_bucket.terraform_state.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
data "aws_iam_policy_document" "terraform_state_policy" {
  statement {
    actions   = ["s3:GetObject", "s3:PutObject", "s3:DeleteObject", "s3:ListBucket"]
    resources = [
      aws_s3_bucket.terraform_state.arn,
      "${aws_s3_bucket.terraform_state.arn}/*",
    ]
    principals {
      type        = "AWS"
      identifiers = [
        "arn:aws:iam::${var.account_id}:user/${var.iam_user}"
      ]
    }
  }
}
resource "aws_s3_bucket_policy" "terraform_state_policy" {
  bucket = aws_s3_bucket.terraform_state.id
  policy = data.aws_iam_policy_document.terraform_state_policy.json
}
resource "aws_dynamodb_table" "terraform_lock" {
  name         = "${var.project_name}-terraform-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name        = "${var.project_name}-terraform-lock"
    Environment = var.environment
  }
}

// End of file: /modules/backend/main.tf
