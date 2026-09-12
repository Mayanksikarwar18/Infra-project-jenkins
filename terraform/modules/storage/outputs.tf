output "storage_account_id" {
  description = "ID of the Azure Storage Account"
  value       = azurerm_storage_account.storage.id
}

output "storage_account_name" {
  description = "Name of the Azure Storage Account"
  value       = azurerm_storage_account.storage.name
}

output "primary_blob_endpoint" {
  description = "Primary Blob Service endpoint URL"
  value       = azurerm_storage_account.storage.primary_blob_endpoint
}
