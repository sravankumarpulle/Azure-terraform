resource "azurerm_storage_account" "storage_account" {
  name                = var.name
  resource_group_name = var.resource_group_name

  location                        = var.location
  account_kind                    = var.account_kind
  account_tier                    = var.account_tier
  account_replication_type        = var.replication_type
  https_traffic_only_enabled       = var.enable_https_traffic_only
  public_network_access_enabled   = var.public_network_access
  allow_nested_items_to_be_public = var.allow_nested_items_to_be_public
  is_hns_enabled                  = var.is_hns_enabled
  tags                            = var.tags

  network_rules {
    default_action             = (length(var.ip_rules) + length(var.virtual_network_subnet_ids)) > 0 ? "Deny" : var.default_action
    ip_rules                   = []
    virtual_network_subnet_ids = var.virtual_network_subnet_ids
    bypass                     = ["AzureServices", "Metrics", "Logging"]
  }

  identity {
    type = "SystemAssigned"
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

// resource "azurerm_storage_management_policy" "storage_life_cycle" {
//   storage_account_id = azurerm_storage_account.storage_account.id

//   rule {
//     name    = var.storage_account_management_policy_rule_name #"rule1"
//     enabled = true
//     filters {
//       prefix_match = [ var.storage_account_management_policy_rule_prefix_match ] #["test"]
//       blob_types   = [ var.storage_account_management_policy_rule_blob_types ] #["blockBlob"]
//     }
//     actions {
//       base_blob {
//         tier_to_cool_after_days_since_modification_greater_than    = var.tier_to_cool_after_days_since_modification_greater_than #30
//         tier_to_archive_after_days_since_last_tier_change_greater_than = var.tier_to_archive_after_days_since_last_tier_change_greater_than  #7
//         tier_to_archive_after_days_since_modification_greater_than = var.tier_to_archive_after_days_since_modification_greater_than #90
//       }
//     }
//   }
// }


// resource "azurerm_key_vault_secret" "storage_account_name" {
//   name         = "adani-ic-storage-account-name"
//   value        = azurerm_storage_account.storage_account.name
//   key_vault_id = data.azurerm_key_vault.key_vault.id
//   // depends_on   = [module.storage_account]
// }

// resource "azurerm_key_vault_secret" "storage_account_key" {
//   name         = "adani-ic-storage-account-key"
//   value        = azurerm_storage_account.storage_account.primary_access_key   #primary_access_key  #primary_connection_string
//   key_vault_id = data.azurerm_key_vault.key_vault.id
//   // depends_on   = [module.storage_account]
// }

module "blob_private_endpoint" {
  source                         = "../private-endpoint"
  name                           = "${azurerm_storage_account.storage_account.name}BlobPrivateEndpoint"
  location                       = var.location
  resource_group_name            = var.resource_group_name
  subnet_id                      = data.azurerm_subnet.endpoint_subnet.id
  tags                           = var.tags
  private_connection_resource_id = azurerm_storage_account.storage_account.id
  is_manual_connection           = var.is_manual_connection
  subresource_name               = "blob"

}

module "dfs_private_endpoint" {
  source                         = "../private-endpoint"
  name                           = "${azurerm_storage_account.storage_account.name}DfsPrivateEndpoint"
  location                       = var.location
  resource_group_name            = var.resource_group_name
  subnet_id                      = data.azurerm_subnet.endpoint_subnet.id
  tags                           = var.tags
  private_connection_resource_id = azurerm_storage_account.storage_account.id
  is_manual_connection           = var.is_manual_connection
  subresource_name               = "dfs"

}

module "file_share_private_endpoint" {
  source                         = "../private-endpoint"
  name                           = "${azurerm_storage_account.storage_account.name}filesharePrivateEndpoint"
  location                       = var.location
  resource_group_name            = var.resource_group_name
  subnet_id                      = data.azurerm_subnet.endpoint_subnet.id
  tags                           = var.tags
  private_connection_resource_id = azurerm_storage_account.storage_account.id
  is_manual_connection           = var.is_manual_connection
  subresource_name               = "File"

}
