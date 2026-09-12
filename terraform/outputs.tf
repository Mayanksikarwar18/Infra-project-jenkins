# ==============================================================================
# Parent Module Outputs: Exposed from Child Modules
# ==============================================================================

output "resource_group_name" {
  description = "Name of the provisioned Resource Group"
  value       = azurerm_resource_group.rg.name
}

output "resource_group_location" {
  description = "Location of the Resource Group"
  value       = azurerm_resource_group.rg.location
}

output "virtual_network_name" {
  description = "Name of the Virtual Network"
  value       = module.network.vnet_name
}

output "virtual_network_id" {
  description = "ID of the Virtual Network"
  value       = module.network.vnet_id
}

output "subnet_name" {
  description = "Name of the workload Subnet"
  value       = module.network.subnet_name
}

output "subnet_id" {
  description = "ID of the workload Subnet"
  value       = module.network.subnet_id
}

output "nat_gateway_public_ip" {
  description = "Static Public IP attached to the NAT Gateway for outbound traffic"
  value       = module.network.nat_gateway_public_ip
}

output "vm_public_ip" {
  description = "Public IP address assigned to the Linux Virtual Machine"
  value       = module.compute.vm_public_ip
}

output "vm_private_ip" {
  description = "Private IP address of the Linux VM inside the Subnet"
  value       = module.compute.vm_private_ip
}

output "storage_account_name" {
  description = "Name of the provisioned Azure Storage Account"
  value       = module.storage.storage_account_name
}

output "ssh_login_command" {
  description = "SSH command to connect to the Linux VM using password authentication"
  value       = module.compute.ssh_login_command
}
