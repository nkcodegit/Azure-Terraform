provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

module "resource_group" {
  source              = "./modules/resource_group"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "nat_gateway" {
  source              = "./modules/nat_gateway"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.location
  public_ip_name      = var.public_ip_name
  nat_gateway_name    = var.nat_gateway_name
}