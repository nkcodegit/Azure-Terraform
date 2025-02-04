variable "lb_name" {
  description = "The name of the load balancer"
  type        = string
}

variable "location" {
  description = "The location of the load balancer"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet"
  type        = string
}

variable "private_ip_address" {
  description = "The private IP address of the load balancer"
  type        = string
}
