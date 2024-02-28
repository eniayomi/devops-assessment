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
  default = "devops-assessment"
}

variable "dns_prefix" {
  default = "k8s"
}

variable "resource_group_name" {
  default = "devops-assessment"
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
  default     = ["10.0.0.0/8"]
}

variable "subnet_address_prefixes" {
  description = "Address prefixes for the AKS subnet"
  default     = ["10.240.0.0/16"]
}

variable "load_balancer_sku" {
  default = "standard"
}

variable "vnet_name" {
  default = "devopsassessmentAks"
}

#######SQL SERVER#######

variable "mssql_server_name" {
  default = "devops-assessment"
}

variable "mssql_version" {
  default = "12.0"
}

variable "administrator_login" {
  
}

variable "administrator_login_password" {
  
}

variable "mssql_db_name" {
  default = "devops-assessment"
}

variable "minimum_tls_version" {
  default = "1.2"
}