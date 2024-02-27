data "azurerm_resource_group" "existing" {
  name = var.resource_group_name
}

resource "azurerm_storage_account" "helm_storage" {
  name                     = var.storage_account_name
  resource_group_name      = data.azurerm_resource_group.existing.name
  location                 = data.azurerm_resource_group.existing.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "production"
    name        = "devops-assessment"
  }
}

resource "azurerm_storage_container" "helm_container" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.helm_storage.name
  container_access_type = "blob"
}