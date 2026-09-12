variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region for networking resources"
}

variable "vnet_name" {
  type        = string
  description = "Name of the Virtual Network"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "Address space CIDR blocks for the Virtual Network"
}

variable "subnet_name" {
  type        = string
  description = "Name of the Subnet"
}

variable "subnet_address_prefixes" {
  type        = list(string)
  description = "Address prefix for the Subnet"
}

variable "environment" {
  type        = string
  description = "Environment identifier"
}

variable "tags" {
  type        = map(string)
  description = "Resource tags"
  default     = {}
}
