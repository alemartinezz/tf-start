# Terraform AWS Backend Setup

This project provides a kickstarter for setting up a Terraform backend using AWS services (S3 and DynamoDB) for managing state files and locking.

## Architecture

This Terraform configuration provisions:

1. **S3 Bucket** for storing the Terraform state with:
    - Versioning enabled.
    - AES256 encryption.
    - Bucket policy to allow specified AWS users to access state files.

2. **DynamoDB Table** for managing state locking.

## Prerequisites

### CLI Tools

- [Terraform CLI](https://www.terraform.io/downloads) (>= 1.4.0)
- [AWS CLI](https://aws.amazon.com/cli/) configured with a valid profile.

### AWS CLI Configuration

Ensure your AWS CLI is configured with a profile that has the necessary permissions to manage S3, DynamoDB, and IAM policies:

```bash
aws configure --profile <your-profile-name>
```

Ensure the profile has access to:

- S3 (create, update, delete buckets)
- DynamoDB (create, update, delete tables)
- IAM (manage S3 bucket policies)

## Usage

### Step 1: Initialize the project

Run the following command to initialize the Terraform configuration:

```bash
terraform init
```

### Step 2: Apply the configuration

Run `terraform apply` to provision the resources:

```bash
terraform apply
```

### Step 3: Outputs

After applying the configuration, the following outputs will be available:

- **s3_bucket_id**: The ID of the S3 bucket.
- **s3_bucket_arn**: The ARN of the S3 bucket.
- **dynamodb_table_name**: The name of the DynamoDB table.

## Customizing

Modify these variables in `variables.tf` or via `terraform.tfvars`:

- **aws_region**: AWS region to use.
- **profile**: AWS CLI profile to use.
- **project_name**: Name for tagging and naming resources.
- **account_id**: AWS account ID.

You can also pass variables via the command line:

```bash
terraform apply -var="project_name=my-project" -var="aws_region=us-east-1"
```

## Cleanup

To destroy all resources created by this configuration:

```bash
terraform destroy
```