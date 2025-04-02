# install the Az.KeyVault module(to be able to use Get-AzKeyVaultSecret) if it does not exist
if (-not (Get-Module -ListAvailable -Name Az.KeyVault)) {
    Write-Host "Az.KeyVault not installed. Installing..."
    Install-Module -Name Az.KeyVault -Scope CurrentUser -Force -AllowClobber
} else {
    Write-Host "Az.KeyVault is already installed."
}

$vaultName = "kv-common101"
$subscriptionKey = "subscriptionId"
$tenantKey = "tenantId"
$terraformServicePrincipalKey = "terraformServicePrincipalId"
$terraformServicePrincipalSecretKey = "terraformServicePrincipalSecret"


# Set environment variables for Azure authentication & terraform backend setup
$env:ARM_SUBSCRIPTION_ID = Get-AzKeyVaultSecret -VaultName $vaultName -Name $subscriptionKey -AsPlainText
$env:ARM_TENANT_ID = Get-AzKeyVaultSecret -VaultName $vaultName -Name $tenantKey -AsPlainText
$env:ARM_CLIENT_ID = Get-AzKeyVaultSecret -VaultName $vaultName -Name $terraformServicePrincipalKey -AsPlainText
$env:ARM_CLIENT_SECRET = Get-AzKeyVaultSecret -VaultName $vaultName -Name $terraformServicePrincipalSecretKey -AsPlainText


Write-Host "Subscription ID from Key Vault: $env:ARM_SUBSCRIPTION_ID"

# Initialize Terraform with backend config
terraform init -backend-config="./backend/backend.dev.config"


# Validate and apply
terraform validate
terraform apply -var-file="./env/dev.tfvars" -auto-approve


# Even with a remote backend, .terraform/ is required locally for Terraform to work, so it gets generated.
# To avoid Backend configuration changed error, the .terraform directory is removed
Remove-Item -Path ".terraform" -Recurse -Force
