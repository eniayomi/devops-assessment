terraform {
  backend "azurerm" {
    resource_group_name   = "devops-assessment"
    storage_account_name  = "eniterraformstates"
    container_name        = "helm-repo-state"
    key                   = "terraform.tfstate"
  }
}
