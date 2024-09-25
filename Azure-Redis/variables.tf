variable "tags" {
  default = {
    Application = "AdaniIC",
    BU = "IC",
    Classification = "Silver",
    Criticality = "Low",
    Env = "DEV",
    Owner = "Parin Shah",
    Role = "Application",
    IAC = "Terraform"
  }
  type    = map(string)
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "vnet_rg_name" {
  type = string
}

variable "pe_subnet_name" {
  type = string
}



variable "redis_cache_name" {
  type = string
}

variable "subscription_id" {}
variable "aks_subnet_name" {}
variable "capacity" {}
variable "family" {}
variable "sku_name" {}
variable "enable_non_ssl_port" {}
variable "minimum_tls_version" {}
variable "public_network_access_enabled" {}
variable "monitor_action_group_name" {}
