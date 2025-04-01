
# Set environment variables for Azure authentication & terraform backend setup
$env:ARM_SUBSCRIPTION_ID = "your-subscription-id"
$env:ARM_TENANT_ID = "your-tenant-id"
$env:ARM_CLIENT_ID = "your-service-principal-id"
$env:ARM_CLIENT_SECRET = "your-client-secret"


# Initialize Terraform with backend config
terraform init -backend-config="./backend/backend.dev.config"


# Validate and apply
terraform validate
terraform apply -var-file="./env/dev.tfvars" -auto-approve


# Even with a remote backend, .terraform/ is required locally for Terraform to work, so it gets generated.
# To avoid Backend configuration changed error, the .terraform directory is removed
Remove-Item -Path ".terraform" -Recurse -Force
