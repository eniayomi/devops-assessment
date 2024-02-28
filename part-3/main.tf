module "aks" {
  source                              = "./modules/aks"
  cluster_name                        = var.cluster_name
  dns_prefix                          = var.dns_prefix
  resource_group_name                 = var.resource_group_name
  node_count                          = var.node_count
  vm_size                             = var.vm_size
  aks_service_principal_app_id        = var.aks_service_principal_app_id
  aks_service_principal_client_secret = var.aks_service_principal_client_secret
  vnet_address_space                  = var.vnet_address_space
  subnet_address_prefixes             = var.subnet_address_prefixes
  tags                                = var.tags
  load_balancer_sku                   = var.load_balancer_sku
  vnet_name                           = var.vnet_name 
}


module "mssql" {
  source                       = "./modules/sql"
  mssql_server_name            = var.mssql_server_name
  resource_group_name          = var.resource_group_name
  mssql_version                = var.mssql_version
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  mssql_db_name                = var.mssql_db_name
  minimum_tls_version          = var.minimum_tls_version
}