provider "azurerm" {
  # Define your provider configuration here
  features {}
}

resource "azurerm_resource_group" "this" {
  name     = var.name
  location = var.location
  tags     = var.tags
}
