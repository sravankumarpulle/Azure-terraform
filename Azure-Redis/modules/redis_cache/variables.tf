variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "tags" {
  type = map(any)
}

variable "capacity" {}
variable "family" {}
variable "sku_name" {}
variable "enable_non_ssl_port" {}
variable "minimum_tls_version" {}
variable "public_network_access_enabled" {}
variable "subscription_id" {
  type = string
}

variable "vnet_rg_name" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "pod_subnet_id" {
  type = string
}
