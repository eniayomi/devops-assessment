variable "node_count" {
  default = 2
}


# Set the values for these variable in terraform.tfvars
variable "aks_service_principal_app_id" {
  default = ""
}

variable "aks_service_principal_client_secret" {
  default = ""
}

variable "cluster_name" {
  default = "demok8s"
}

variable "dns_prefix" {
  default = "demok8s"
}

variable "resource_group_name" {
  default = "demo-terraform-kubernetes-RG"
}

variable "vm_size" {
  default = "Standard_D2_v2"
}

variable "tags" {
  default = {
    Environment = "production"
    Name        = "devops-assessment"
  }
}

variable "vnet_address_space" {
  description = "Address space for the AKS Virtual Network"
}

variable "subnet_address_prefixes" {
  description = "Address prefixes for the AKS subnet"
}

variable "load_balancer_sku" {
  
}

variable "disk_size_gb" {
  default = 50
}

variable "vnet_name" {

}