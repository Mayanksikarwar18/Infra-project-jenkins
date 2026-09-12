# ==============================================================================
# Parent (Root) Module: Orchestrates Resource Group and Child Modules
# ==============================================================================

# 1. Central Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

# 2. Child Module: Network (VNet, Subnet, NAT Gateway, NAT Public IP)
module "network" {
  source                  = "./modules/network"
  resource_group_name     = azurerm_resource_group.rg.name
  location                = azurerm_resource_group.rg.location
  vnet_name               = var.vnet_name
  vnet_address_space      = var.vnet_address_space
  subnet_name             = var.subnet_name
  subnet_address_prefixes = var.subnet_address_prefixes
  environment             = var.environment
  tags                    = var.tags
}

# 3. Child Module: Compute (Linux VM with Password Authentication, NIC, NSG, VM Public IP)
module "compute" {
  source                = "./modules/compute"
  resource_group_name   = azurerm_resource_group.rg.name
  location              = azurerm_resource_group.rg.location
  subnet_id             = module.network.subnet_id
  vm_name               = var.vm_name
  vm_size               = var.vm_size
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  ssh_allowed_source_ip = var.ssh_allowed_source_ip
  tags                  = var.tags
}

# 4. Child Module: Storage (Azure Storage Account)
module "storage" {
  source                           = "./modules/storage"
  resource_group_name              = azurerm_resource_group.rg.name
  location                         = azurerm_resource_group.rg.location
  storage_account_name_prefix      = var.storage_account_name_prefix
  storage_account_tier             = var.storage_account_tier
  storage_account_replication_type = var.storage_account_replication_type
  tags                             = var.tags
}
