variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region for compute resources"
}

variable "subnet_id" {
  type        = string
  description = "ID of the subnet where the VM NIC will be attached"
}

variable "vm_name" {
  type        = string
  description = "Name of the Linux Virtual Machine"
  default     = "vm-linux-dev"
}

variable "vm_size" {
  type        = string
  description = "Azure VM size SKU"
  default     = "Standard_B2s"
}

variable "admin_username" {
  type        = string
  description = "Admin username for Linux VM"
  default     = "azureuser"
}

variable "admin_password" {
  type        = string
  description = "Admin password for Linux VM"
  sensitive   = true
  default     = "P@ssw0rdSecure2026!"
}

variable "ssh_allowed_source_ip" {
  type        = string
  description = "Source IP or CIDR block allowed to connect via SSH"
  default     = "*"
}

variable "tags" {
  type        = map(string)
  description = "Resource tags"
  default     = {}
}
