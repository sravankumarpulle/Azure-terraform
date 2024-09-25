variable "service_bus_namespace" {}
variable "location" {}
variable "resource_group_name" {}
variable "vnet_name" {}
variable "vnet_rg_name" {}
variable "pe_subnet_name" {}
variable "key_vault_name" {}

variable "tags" {
  default = {}
  type    = map(string)
}


variable "sku" {}

variable "capacity" {}
variable "public_network_access_enabled" {}
variable "default_action" {}
variable  "trusted_services_allowed" {}
variable "servicebus_queue_name" {}
variable "service_bus_topic_name"{}
variable "servicebus_subscription_name" {}


variable "is_manual_connection" {}

variable "max_size_in_megabytes" {}

variable "max_delivery_count" {} 
