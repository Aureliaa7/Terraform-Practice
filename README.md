# Terraform Automation with PowerShell

### Azure Backend Setup (Blob Storage + Service Principal)

Use PowerShell scripts to automate Terraform workflows for multiple environments (`dev`, `prod`) with remote backend configuration in Azure.

Make sure to remove any existing _.terraform_ directory to avoid **Backend configuration changed** error when running the PowerShell script.

## Script overview
1. Sets the required environment variables for authenticating with Azure using a Service Principal
2. Initializes the backend using a per-environment config file
3. Validates the Terraform configuration
4. Runs `plan` and `apply` using the environment-specific variable file


## How to run
```powershell
.\run-dev.ps1
```

