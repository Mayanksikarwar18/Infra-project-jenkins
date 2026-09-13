# Environment: Development
environment                      = "dev"
location                         = "centralindia"
resource_group_name              = "rg-infra-dev"
vnet_name                        = "vnet-infra-dev"
vnet_address_space               = ["10.0.0.0/16"]
subnet_name                      = "snet-workload-dev"
subnet_address_prefixes          = ["10.0.1.0/24"]
storage_account_name_prefix      = "stdevinfra"
storage_account_tier             = "Standard"
storage_account_replication_type = "LRS"

# Linux VM Specifications
vm_name        = "vm-linux-dev"
vm_size        = "Standard_B2as_v2"
admin_username = "azureuser"

# Note: In Azure DevOps CI/CD, admin_password is best injected via secret pipeline variable:
# TF_VAR_admin_password = $(VM_ADMIN_PASSWORD)
# A default placeholder is provided for development validation:
admin_password = "P@ssw0rdDev2026!"

ssh_allowed_source_ip = "*"

tags = {
  Environment = "dev"
  ManagedBy   = "Terraform"
  Project     = "Azure-DevOps-Infra"
}
