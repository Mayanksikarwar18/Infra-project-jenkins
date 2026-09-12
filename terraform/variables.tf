variable "environment" {
  type        = string
  description = "Environment identifier (e.g., dev, test, prod)"
  default     = "dev"
}

variable "location" {
  type        = string
  description = "Azure region where all resources will be provisioned"
  default     = "eastus"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the Azure Resource Group"
  default     = "rg-infra-dev"
}

variable "vnet_name" {
  type        = string
  description = "Name of the Virtual Network"
  default     = "vnet-infra-dev"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "CIDR block address space for the Virtual Network"
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  type        = string
  description = "Name of the Subnet hosting the workload"
  default     = "snet-workload-dev"
}

variable "subnet_address_prefixes" {
  type        = list(string)
  description = "Address prefix for the Subnet"
  default     = ["10.0.1.0/24"]
}

variable "storage_account_name_prefix" {
  type        = string
  description = "Prefix for the Azure Storage Account (must be globally unique, 3-24 alphanumeric lowercase)"
  default     = "stinfra"
}

variable "storage_account_tier" {
  type        = string
  description = "Performance tier for the storage account"
  default     = "Standard"
}

variable "storage_account_replication_type" {
  type        = string
  description = "Data replication strategy for the storage account (LRS, GRS, ZRS, etc.)"
  default     = "LRS"
}

variable "vm_name" {
  type        = string
  description = "Name of the Linux Virtual Machine"
  default     = "vm-linux-dev"
}

variable "vm_size" {
  type        = string
  description = "Azure VM SKU size"
  default     = "Standard_B2s"
}

variable "admin_username" {
  type        = string
  description = "Administrator username for Linux VM"
  default     = "azureuser"
}

variable "admin_password" {
  type        = string
  description = "Administrator password for Linux VM (Password authentication enabled)"
  sensitive   = true
  default     = "P@ssw0rdSecure2026!"
}

variable "ssh_allowed_source_ip" {
  type        = string
  description = "Source IP/CIDR allowed to SSH into the Linux VM (Default '*' allows any IP, restrict for production)"
  default     = "*"
}

variable "tags" {
  type        = map(string)
  description = "Resource tags applied to all Azure resources"
  default = {
    Environment = "Development"
    ManagedBy   = "Terraform"
    Project     = "Azure-DevOps-Infra"
  }
}
