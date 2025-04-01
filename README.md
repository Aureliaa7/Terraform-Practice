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

