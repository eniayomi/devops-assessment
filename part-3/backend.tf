terraform {
  backend "azurerm" {
    resource_group_name   = "devops-assessment"
    storage_account_name  = "eniterraformstates"
    container_name        = "aks-state"
    key                   = "terraform.tfstate"
  }
}
