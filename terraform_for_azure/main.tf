
# create a resource group
resource "azurerm_resource_group" "rg_main" {
  name     = "rg-${var.application_name}-${var.environment_name}"
  location = var.primary_location
}

# create a random string which will be used as a suffix for the storage account name
resource "random_string" "storage_account_suffix" {
  length  = 10
  upper   = false
  special = false
}

# create a storage account
resource "azurerm_storage_account" "tf_sa" {
  name                     = "st${random_string.storage_account_suffix.result}"
  location                 = var.primary_location
  resource_group_name      = azurerm_resource_group.rg_main.name
  account_tier             = "Standard"
  account_replication_type = "GRS"
}


# create a storage container
resource "azurerm_storage_container" "tf_container" {
  name                  = "tf-container"
  storage_account_id    = azurerm_storage_account.tf_sa.id
  container_access_type = "private"
}
