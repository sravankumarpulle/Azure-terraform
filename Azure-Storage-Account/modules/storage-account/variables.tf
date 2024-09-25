variable "resource_group_name" {
  description = "(Required) Specifies the resource group name of the storage account"
  type        = string
}

variable "name" {
  description = "(Required) Specifies the name of the storage account"
  type        = string
}

variable "location" {
  description = "(Required) Specifies the location of the storage account"
  type        = string
}

variable "account_kind" {
  description = "(Optional) Specifies the account kind of the storage account"
  type        = string
}

variable "account_tier" {
  description = "(Optional) Specifies the account tier of the storage account"
  type        = string
}

variable "replication_type" {
  description = "(Optional) Specifies the replication type of the storage account"
  type        = string
}

variable "is_hns_enabled" {
  description = "(Optional) Specifies the replication type of the storage account"
  type        = bool
}

variable "default_action" {
  description = "Allow or disallow public access to all blobs or containers in the storage accounts. The default interpretation is true for this property."
  type        = string
}

variable "ip_rules" {
  description = "Specifies IP rules for the storage account"
  default     = []
  type        = list(string)
}

variable "virtual_network_subnet_ids" {
  description = "Specifies a list of resource ids for subnets"
  default     = []
  type        = list(string)
}

variable "kind" {
  description = "(Optional) Specifies the kind of the storage account"
  default     = ""
}

variable "tags" {
  description = "(Optional) Specifies the tags of the storage account"
  default     = {}
}

variable "public_network_access" {
  description = "(Optional) Whether public network access is allowed for this Key Vault. Defaults to true"
  type        = bool
}

variable "allow_nested_items_to_be_public" {
  description = "Can nested items in the storage account opt into allowing public access?"
  type        = bool
}

variable "enable_https_traffic_only" {
  description = "Is traffic only allowed via HTTPS? See here for more information."
  type        = bool
}

variable "vnet_name" {}

variable "vnet_rg_name" {}

variable "blob_private_dns_zone_group_name" {}
variable "dfs_private_dns_zone_group_name" {}
variable "is_manual_connection" {}
variable "virtual_network_name" {}
variable "private_endpoint_subnet_name" {}
variable "key_vault_name" {}

// variable "storage_account_management_policy_rule_name" {}
// variable "tier_to_cool_after_days_since_modification_greater_than" {}
// variable "tier_to_archive_after_days_since_last_tier_change_greater_than" {}
// variable "tier_to_archive_after_days_since_modification_greater_than" {}
// variable "storage_account_management_policy_rule_prefix_match" {}
// variable "storage_account_management_policy_rule_blob_types" {}
