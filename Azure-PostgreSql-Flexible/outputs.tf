output "vault_uri" {
  value = data.azurerm_key_vault.key_vault.vault_uri
}

output "db_password" {
  value = module.postgresql_database.postgres_password
  sensitive = true
}