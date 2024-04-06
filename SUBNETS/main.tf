// Define the Azure Provider

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

//Reference the Existing VNet

data "azurerm_virtual_network" "existing_vnet" {
  name                = "existing-vnet-name"
  resource_group_name = "existing-resource-group"
}

// Add Subnets
resource "azurerm_subnet" "example_subnet" {
  name                 = "example-subnet"
  resource_group_name  = data.azurerm_virtual_network.existing_vnet.resource_group_name
  virtual_network_name = data.azurerm_virtual_network.existing_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}
