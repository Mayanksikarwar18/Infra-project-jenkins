# Environment: Staging
environment                      = "staging"
location                         = "centralindia"
resource_group_name              = "rg-infra-staging"
vnet_name                        = "vnet-infra-staging"
vnet_address_space               = ["10.1.0.0/16"]
subnet_name                      = "snet-workload-staging"
subnet_address_prefixes          = ["10.1.1.0/24"]
storage_account_name_prefix      = "ststginfra"
storage_account_tier             = "Standard"
storage_account_replication_type = "LRS"

# Linux VM Specifications
vm_name        = "vm-linux-staging"
vm_size        = "Standard_B2as_v2"
admin_username = "azureuser"
admin_password = "P@ssw0rdStaging2026!"

ssh_allowed_source_ip = "*"

tags = {
  Environment = "staging"
  ManagedBy   = "Terraform"
  Project     = "Azure-DevOps-Infra"
}
