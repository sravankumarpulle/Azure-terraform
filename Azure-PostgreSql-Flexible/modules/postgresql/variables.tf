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
  type = map(string)
}

variable "delegated_subnet_id" {
  type = string
}
variable "administrator_login" {
  type = string
}

variable "sku_name" {
  type = string
}

variable "storage_mb" {
  type = number
}

variable "psql_version" {
  type = string
}

variable "backup_retention_days" {
  type = number
}

variable "geo_redundant_backup_enabled" {
  type = bool
}

variable "public_network_access_enabled" {
  type = bool
}

variable "charset" {
  type    = string
  default = "UTF8"
}

variable "collation" {
  type    = string
  default = "en_US.utf8"
}

variable "keyvault_id" {}
variable "subscription_id" {}
variable "vnet_name" {}
variable "pe_subnet_id" {}
variable "vnet_rg_name" {}
variable "delegated_subnet_name" {}
variable "private_dns_zone_id" {}
variable "postgres_db_name" {}
// variable "postgres_high_availability_mode" {}
// variable "postgres_standby_availability_zone" {}

