**Bootstrap Environment**  
- In `/env/bootstrap/main.tf`, a local backend is used to create the S3 bucket and DynamoDB table once.  
- The `bootstrap.tfvars` file provides values (like `project_name`, `account_id`, `iam_user`) to provision these backend resources.  
- After applying, the bucket and table are available for remote state storage.

**Dev, Stg, and Prod Environments**  
- Each environment’s `main.tf` configures a remote S3 backend pointing to the same bucket and table, using a unique key (e.g., `dev/terraform.tfstate`, `stg/terraform.tfstate`, `prod/terraform.tfstate`) for state isolation.  
- Their respective `*.tfvars` files set environment-specific variables (such as `company_name` and `app_name`).

**Modules**  
- The **backend module** (in `/modules/backend`) creates the bucket and DynamoDB table and outputs their details.  
- The **app module** (in `/modules/app`) provisions application resources (like Secrets Manager) using the provided variables.

**Commands for Each Environment**

1. **Bootstrap (one-time execution):**
   ```bash
   cd env/bootstrap
   terraform init
   terraform apply -var-file=bootstrap.tfvars
   ```

2. **Development (dev):**
   ```bash
   cd env/dev
   terraform init -var-file=dev.tfvars
   terraform apply -var-file=dev.tfvars
   ```

3. **Staging (stg):**
   ```bash
   cd env/stg
   terraform init -var-file=stg.tfvars
   terraform apply -var-file=stg.tfvars
   ```

4. **Production (prod):**
   ```bash
   cd env/prod
   terraform init -var-file=prod.tfvars
   terraform apply -var-file=prod.tfvars
   ```

This setup allows a one-time bootstrap to create the backend resources, and then each environment uses the same bucket and table—with its state stored in a unique key.