variable "app_service_plan_name"{
    description = "app service plan name"
    type = string
}

variable "resource_group_name" {
    description = "resource group name"
    type = string
}

variable "location" {
    description = "location"
    type = string
}

variable "sku_tier"{
    description = "sku tier of app service plan"
    type = string
}

variable "sku_size"{
    description = "sku size of app service plan"
    type = string
}

variable "function_app_name" {
    description= "function app name"
    type = string
}

variable "storage_account_name" {
    description= "storage account name"
    type = string
}



variable "maximum_elastic_worker_count"{}

variable "reserved" {}

variable "per_site_scaling" {}

variable "public_network_access_enabled" {}

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
variable "vnet_name" {}

variable "vnet_rg_name" {}

variable "subscription_id" {}

variable "pe_subnet_name" {}
variable "elastic_instance_minimum" {}