module "storage_account" {
  source                          = "./modules/storage-account"
  name                            = var.name
  location                        = data.azurerm_resource_group.rg.location
  resource_group_name             = data.azurerm_resource_group.rg.name
  account_kind                    = var.account_kind
  account_tier                    = var.account_tier
  replication_type                = var.replication_type
  public_network_access           = var.public_network_access
  allow_nested_items_to_be_public = var.allow_nested_items_to_be_public
  enable_https_traffic_only       = var.enable_https_traffic_only
  is_hns_enabled                  = var.is_hns_enabled
  is_manual_connection            = var.is_manual_connection
  virtual_network_name            = var.virtual_network_name
  private_endpoint_subnet_name    = var.private_endpoint_subnet_name
  default_action                  = var.default_action
  ip_rules                        = []
  vnet_rg_name                    = var.vnet_rg_name
  vnet_name                       = var.vnet_name
  tags                            = var.tags
  blob_private_dns_zone_group_name     = var.blob_private_dns_zone_group_name #"BlobPrivateDnsZoneGroup"
  dfs_private_dns_zone_group_name     = var.dfs_private_dns_zone_group_name #"DfsPrivateDnsZoneGroup"
  key_vault_name                  = var.key_vault_name
  // file_private_dns_zone_group_name   = var.file_private_dns_zone_group_name
  // storage_account_management_policy_rule_name = var.storage_account_management_policy_rule_name
  // tier_to_cool_after_days_since_modification_greater_than = var.tier_to_cool_after_days_since_modification_greater_than
  // tier_to_archive_after_days_since_last_tier_change_greater_than = var.tier_to_archive_after_days_since_last_tier_change_greater_than
  // tier_to_archive_after_days_since_modification_greater_than = var.tier_to_archive_after_days_since_modification_greater_than
  // storage_account_management_policy_rule_prefix_match = var.storage_account_management_policy_rule_prefix_match 
  // storage_account_management_policy_rule_blob_types = var.storage_account_management_policy_rule_blob_types
}

