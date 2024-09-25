variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type        = string
  description = "Location of the resource group."
}

variable "tags" {
  type = map(string)
}

variable "sku_name" {
  type = string
}



variable "auto_stop_enabled" {
  type = bool
}

variable "disk_encryption_enabled" {
  type = bool
}

variable "streaming_ingestion_enabled" {
  type = bool
}

variable "public_network_access_enabled" {
  type = bool
}

variable "purge_enabled" {
  type = bool
}

variable "zones" {
  type = list(string)
}

variable "engine" {
  type = string
}

variable "maximum_instances" {}
variable "minimum_instances" {}

variable "subscription_id" {}
variable "vnet_name" {}
variable "pe_subnet_id" {}
variable "vnet_rg_name" {}
variable "keyvault_id" {
  type = string
}
