variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region for storage account"
}

variable "storage_account_name_prefix" {
  type        = string
  description = "Prefix for storage account (alphanumeric lowercase)"
  default     = "stinfra"
}

variable "storage_account_tier" {
  type        = string
  description = "Performance tier"
  default     = "Standard"
}

variable "storage_account_replication_type" {
  type        = string
  description = "Replication strategy (LRS, GRS, etc.)"
  default     = "LRS"
}

variable "tags" {
  type        = map(string)
  description = "Resource tags"
  default     = {}
}
