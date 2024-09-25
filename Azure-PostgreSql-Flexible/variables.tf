variable "tags" {
  default = {
    Application = "AdaniIC",
    BU = "IC",
    Classification = "Silver",
    Criticality = "Low",
    Env = "PROD",
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

variable "delegated_subnet_name" {
  type = string
}

variable "key_vault" {
  type = string
}

variable "postgresql_name" {
  type = string
}

variable "sku_name" {}
variable "psql_version" {}
variable "backup_retention_days" {}
variable "storage_mb" {}
variable "administrator_login" {}
variable "public_network_access_enabled" {}
variable "geo_redundant_backup_enabled" {}
variable "private_dns_zone_id" {}
variable "subscription_id" {}
variable "postgres_db_name" {}
variable "monitor_action_group_name" {}
// variable "postgres_high_availability_mode" {}
// variable "postgres_standby_availability_zone" {}
