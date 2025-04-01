# Use the required_providers block to set the Azure Provider source and version being used

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/azure_cli#configuring-azure-cli-authentication-in-terraform

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.25.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.6.3"
    }
  }
  backend "azurerm" {
    use_oidc         = true # Can also be set via `ARM_USE_OIDC` environment variable.
    use_azuread_auth = true # Can also be set via `ARM_USE_AZUREAD` environment variable.
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}
