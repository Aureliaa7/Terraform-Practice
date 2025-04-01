# Terraform + Azure Backend Setup (Blob Storage + Service Principal)

#### 1. For terraform backend, create a storage container for storing the terraform state file(create resource group -> create storage account -> create blob container)

#### 2. In Azure create a Service Principal and generate a client secret which will be later used to authenticate to the storage container holding the terraform state file

#### 3. Navigate to the subscriptions page -> select your subscription -> role assignment(IAM section) -> add role assignment ->add Contributor permissions to the Service Principal so it can perform operations on resources (not recommended).

#### Navigate to the storage account page and add a role assignment: Storage Blob Data Contributor for the created Service Principal.

## For best security: **Use the least privilege model** and scope access to only what's needed.

#### 4. In PowerShell run the following commands:

```bash
   $env:ARM_SUBSCRIPTION_ID="your-subscription-id"
   $env:ARM_TENANT_ID="your-tenant-id"
   $env:ARM_CLIENT_ID="your-app-id"
   $env:ARM_CLIENT_SECRET="your-client-secret"
```

#### 5. Run **`terraform init`**

#### 6. Run **`terraform plan`** command to see the execution plan (optional, running **`terraform apply`** will display the current plan)

#### 7. Run **`terraform apply -var-file ./env.prod.tfvars`** to execute the plan

#### 8. Check Azure to see the created resources

## Once the Azure resources needed to store the terraform state files exist(storage container, service principal, needed permissions), skip the first 3 steps.

[Terraform Backend AAD auth](https://developer.hashicorp.com/terraform/language/backend/azurerm#azure-active-directory)
