resource "azurerm_kubernetes_cluster" "k8s" {
  location            = data.azurerm_resource_group.rg.location
  name                = var.cluster_name
  resource_group_name = data.azurerm_resource_group.rg.name
  node_resource_group = "K8S${data.azurerm_resource_group.rg.name}"
  dns_prefix          = var.dns_prefix
  tags                = {
    Environment = "production"
    Name        = "devops-assessment"
  }

  default_node_pool {
    name            = "default"
    vm_size         = var.vm_size
    node_count      = var.node_count
    os_disk_size_gb = var.disk_size_gb
    vnet_subnet_id  = azurerm_subnet.aks_subnet.id
  }

  network_profile {
    network_plugin    = "azure"
    network_policy    = "azure"
    load_balancer_sku = var.load_balancer_sku
  }

  service_principal {
    client_id     = var.aks_service_principal_app_id
    client_secret = var.aks_service_principal_client_secret
  }
}