# Define sql server
resource "azurerm_mssql_server" "mssql_server" {
  name                         = var.mssql_server_name
  resource_group_name          = data.azurerm_resource_group.rg.name
  location                     = data.azurerm_resource_group.rg.location
  version                      = var.mssql_version
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  minimum_tls_version          = var.minimum_tls_version
}

# Define sql database
resource "azurerm_mssql_database" "mssql_db" {
  name                = var.mssql_db_name
  server_id           = azurerm_mssql_server.mssql_server.id

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }

  depends_on = [
    azurerm_mssql_server.mssql_server
  ]
}