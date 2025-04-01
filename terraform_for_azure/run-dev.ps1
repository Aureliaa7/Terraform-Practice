
# Set environment variables for Azure authentication & terraform backend setup
$env:ARM_SUBSCRIPTION_ID = "your-subscription-id"
$env:ARM_TENANT_ID = "your-tenant-id"
$env:ARM_CLIENT_ID = "your-service-principal-id"
$env:ARM_CLIENT_SECRET = "ypur-client-secret"


# Initialize Terraform with backend config
terraform init -reconfigure -backend-config="./backend/backend.dev.config"

# Validate and apply
terraform validate
terraform plan -var-file="./env/dev.tfvars"
terraform apply -var-file="./env/dev.tfvars" -auto-approve
