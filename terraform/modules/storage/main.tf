resource "random_string" "storage_suffix" {
  length  = 6
  special = false
  upper   = false
}

resource "azurerm_storage_account" "storage" {
  name                       = "${lower(var.storage_account_name_prefix)}${random_string.storage_suffix.result}"
  resource_group_name        = var.resource_group_name
  location                   = var.location
  account_tier               = var.storage_account_tier
  account_replication_type   = var.storage_account_replication_type
  min_tls_version            = "TLS1_2"
  https_traffic_only_enabled = true
  tags                       = var.tags
}
