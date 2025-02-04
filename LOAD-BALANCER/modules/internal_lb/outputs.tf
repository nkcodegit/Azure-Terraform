
output "lb_id" {
  description = "The ID of the internal load balancer"
  value       = azurerm_lb.internal.id
}