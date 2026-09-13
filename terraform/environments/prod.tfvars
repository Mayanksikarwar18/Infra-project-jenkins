# Environment: Production
environment                      = "prod"
location                         = "centralindia"
resource_group_name              = "rg-infra-prod"
vnet_name                        = "vnet-infra-prod"
vnet_address_space               = ["10.2.0.0/16"]
subnet_name                      = "snet-workload-prod"
subnet_address_prefixes          = ["10.2.1.0/24"]
storage_account_name_prefix      = "stprodinfra"
storage_account_tier             = "Standard"
storage_account_replication_type = "GRS"

# Linux VM Specifications
vm_name        = "vm-linux-prod"
vm_size        = "Standard_B2as_v2"
admin_username = "azureuser"
admin_password = "P@ssw0rdProd2026!"

ssh_allowed_source_ip = "*"

tags = {
  Environment = "prod"
  ManagedBy   = "Terraform"
  Project     = "Azure-DevOps-Infra"
}
