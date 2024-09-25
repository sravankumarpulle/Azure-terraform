// resource "azurerm_role_assignment" "role_assignment" {
//   principal_id   = module.function_app.principal_id
//   role_definition_name = "Storage Blob Data Contributor"
// //   scope          = "/subscriptions/<subscription_id>/resourceGroups/<resource_group_name>/providers/Microsoft.Storage/storageAccounts/${var.storage_account_name}"
// }
// resource "azurerm_role_assignment" "afa_access_asa" {
//   scope                = data.azurerm_storage_account.storage_account.id
//   role_definition_name = "Storage Blob Data Contributor"
//   principal_id         = module.function_app.principal_id
//   depends_on           = [data.azurerm_storage_account.storage_account, module.function_app]
// }