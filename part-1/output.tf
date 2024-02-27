output "storage_account_name" {
  value = azurerm_storage_account.helm_storage.name
}

output "container_name" {
  value = azurerm_storage_container.helm_container.name
}

output "primary_blob_endpoint" {
  value = azurerm_storage_account.helm_storage.primary_blob_endpoint
}
