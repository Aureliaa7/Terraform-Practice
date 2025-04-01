
# create a resource group
resource "azurerm_resource_group" "rg_main" {
  name     = "rg-${var.application_name}-${var.environment_name}"
  location = var.primary_location
}

# get the current terraform user context
data "azurerm_client_config" "current" {
}

resource "random_string" "key_vault_suffix" {
  length  = 6
  upper   = false
  special = false
}

resource "azurerm_key_vault" "terraform_kv_101" {
  name                = "kv-${var.environment_name}-${random_string.key_vault_suffix.result}"
  location            = var.primary_location
  resource_group_name = azurerm_resource_group.rg_main.name
  tenant_id           = data.azurerm_client_config.current.tenant_id # get the tenant id from the current user context
  sku_name            = "standard"
}
