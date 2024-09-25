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
  type = map(any)
}
variable "elastic_instance_minimum" {}
variable "pe_subnet_id" {}