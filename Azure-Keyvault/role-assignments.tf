// resource "azurerm_key_vault_secret" "adani-ic-mqqt-password" {
//   name         = "adani-ic-mqqt-password"
//   key_vault_id = module.key_vault.id
//   value        = "adaniMqttSept23"
//   depends_on   = [module.key_vault]
// }


// resource "azurerm_key_vault_secret" "adani-ic-mqqt-username" {
//   name         = "adani-ic-mqqt-username"
//   key_vault_id = module.key_vault.id
//   value        = "adaniMqtt_user"
//   depends_on   = [module.key_vault]
// }

// resource "azurerm_key_vault_secret" "adani-ic-mqqt-broker" {
//   name         = "adani-ic-mqqt-broker"
//   key_vault_id = module.key_vault.id
//   value        = "hap.faclon.com"
//   depends_on   = [module.key_vault]
// }


// resource "azurerm_key_vault_secret" "adani-ic-aodb-api-pass" {
//   name         = "adani-ic-aodb-api-pass"
//   key_vault_id = module.key_vault.id
//   value        = "BackDoor$23"
//   depends_on   = [module.key_vault]
// }