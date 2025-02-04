resource "azurerm_lb" "internal" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku = "Standard"

  frontend_ip_configuration {
    name                         = "LoadBalancerFrontEnd"
    subnet_id                    = var.subnet_id
    private_ip_address_allocation = "Static"
    private_ip_address           = var.private_ip_address
  }
}

resource "azurerm_lb_backend_address_pool" "bpepool" {
  name            = "BackEndAddressPool"
  loadbalancer_id = azurerm_lb.internal.id
}

resource "azurerm_lb_probe" "lbprobe" {
  name                = "HealthProbe"
  loadbalancer_id     = azurerm_lb.internal.id
  protocol            = "Tcp"
  port                = 80
  interval_in_seconds = 5
  number_of_probes    = 2
}

resource "azurerm_lb_rule" "lbrule" {
  name                           = "HTTP"
  loadbalancer_id                = azurerm_lb.internal.id
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "LoadBalancerFrontEnd"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.bpepool.id]
  probe_id                       = azurerm_lb_probe.lbprobe.id
}
