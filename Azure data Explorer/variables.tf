variable "tags" {
  default = {
    Application = "AdaniIC",
    BU = "IC",
    Classification = "Silver",
    Criticality = "Low",
    Env = "QA",
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

variable "key_vault_name" {
  type = string
}

variable "data_explorer_cluster_name" {
  type = string
}

variable "data_explorer_database_name" {
  type = string
}

variable "auto_stop_enabled" {}
variable "disk_encryption_enabled" {}
variable "streaming_ingestion_enabled" {}
variable "public_network_access_enabled" {}
variable "purge_enabled" {}
variable "zones" {}
variable "engine" {}
variable "sku_name" {}
variable "maximum_instances" {}
variable "minimum_instances" {}
variable "hot_cache_period" {}
variable "soft_delete_period" {}
variable "subscription_id" {}
variable "monitor_action_group_name" {}


