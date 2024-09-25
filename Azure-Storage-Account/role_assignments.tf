// resource "azurerm_key_vault_secret" "storage_account_name" {
//   name         = "adani-ic-storage-account-name"
//   value        = module.storage_account.name
//   key_vault_id = data.azurerm_key_vault.key_vault.id
//   depends_on   = [module.storage_account]
// }

// resource "azurerm_key_vault_secret" "storage_account_key" {
//   name         = "adani-ic-storage-account-key"
//   value        = module.storage_account.primary_connection_string   #primary_access_key
//   key_vault_id = data.azurerm_key_vault.key_vault.id
//   depends_on   = [module.storage_account]
// }

// import {
//   to = azurerm_storage_data_lake_gen2_filesystem.ehone
//   id = "https://az01asaqa01.blob.core.windows.net/eventhub01"
// }