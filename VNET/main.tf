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
