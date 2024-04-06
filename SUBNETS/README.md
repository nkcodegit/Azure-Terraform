Define the Azure Provider: Ensure you have the Azure provider defined in your Terraform configuration.

```hcl
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
```

Reference the Existing VNet: Use a data block to reference the existing VNet. You'll need the name of the VNet and the resource group it belongs to.

```hcl
data "azurerm_virtual_network" "existing_vnet" {
  name                = "existing-vnet-name"
  resource_group_name = "existing-resource-group"
}
```

Add Subnets: Define the subnets you want to add. Here's how you can define a subnet and associate it with the VNet.

```hcl
resource "azurerm_subnet" "example_subnet" {
  name                 = "example-subnet"
  resource_group_name  = data.azurerm_virtual_network.existing_vnet.resource_group_name
  virtual_network_name = data.azurerm_virtual_network.existing_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

```
You can repeat the azurerm_subnet resource block for as many subnets as you need, ensuring each has a unique name and address prefix.

Apply Configuration: After defining the configuration, use terraform init to initialize the Terraform configuration and terraform apply to apply the changes.
