variable "resource_group_name" {
  description = "The name of the resource group in which to create the Helm repository storage account."
  type        = string
  default     = "devops-assessment"
}

variable "location" {
  description = "The Azure location where the resources will be created."
  type        = string
  default     = "East US"
}

variable "storage_account_name" {
  description = "The name of the storage account to be used for the Helm repository. Must be unique across Azure."
  type        = string
}

variable "container_name" {
  description = "The name of the storage container within the storage account to be used for Helm charts."
  type        = string
  default     = "helm"
}
