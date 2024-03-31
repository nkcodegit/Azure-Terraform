To create an Azure Virtual Network (VNet) using Terraform in a modular approach, you'll need to create a module for the VNet and then define the necessary variables to make the module flexible and reusable. Below is a basic structure to help you get started.

First, let's define the VNet module. Create a directory named azure_vnet and add two files: main.tf and variables.tf.

azure_vnet/main.tf: This file contains the Terraform code to create the VNet.

```hcl
provider "azurerm" {
  features {}
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = var.tags
}
```

azure_vnet/variables.tf: This file declares the variables used in the module.
```hcl
variable "name" {
  description = "The name of the virtual network."
  type        = string
}

variable "address_space" {
  description = "The address space that is used by the virtual network."
  type        = list(string)
}

variable "location" {
  description = "The location of the resources."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the virtual network."
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
```

Now, you can use this module in your Terraform configuration.

Create a main.tf in your root directory:

```hcl
module "azure_vnet" {
  source              = "./azure_vnet"
  name                = "myVNet"
  address_space       = ["10.0.0.0/16"]
  location            = "Southeast Asia"
  resource_group_name = "myResourceGroup"

  tags = {
    environment = "dev"
  }
}
```
Don't forget to initialize Terraform and apply the configuration:
```hcl
terraform init
terraform apply
```

This structure separates the VNet creation logic into a module, making it reusable for different environments or configurations. You can further expand the module and variables to include subnets, NSG rules, or any other components that you might need for a complete networking setup in Azure.
