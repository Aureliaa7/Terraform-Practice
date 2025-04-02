# Terraform Automation with PowerShell

### Azure Backend Setup (Blob Storage + Service Principal)

Use PowerShell scripts to automate Terraform workflows for multiple environments (`dev`, `prod`) with remote backend configuration in Azure.


## Script overview
1. Sets the required environment variables for authenticating with Azure using a Service Principal
2. Initializes the backend using a per-environment config file
3. Validates the Terraform configuration
4. Runs `plan` and `apply` using the environment-specific variable file
5. Performs cleanup by removing the _.terraform_ directory


## How to run
```powershell
.\run-dev.ps1
```


### References
* [Manage secrets from Azure Key Vault using PowerShell](https://learn.microsoft.com/en-us/azure/key-vault/secrets/quick-create-powershell)
* [azurerm_role_assignment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment)
