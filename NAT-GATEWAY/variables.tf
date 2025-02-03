variable "subscription_id" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "public_ip_name" {
  type = string
}

variable "nat_gateway_name" {
  type = string
}

variable "tenant_id" {
  description = "The Tenant ID for the Azure subscription"
  type        = string
}

variable "client_id" {
  description = "The Client ID for the Azure subscription"
  type        = string
}

variable "client_secret" {
  description = "The Client Secret for the Azure subscription"
  type        = string
}

