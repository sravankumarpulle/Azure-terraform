output "id" {
  value = azurerm_postgresql_flexible_server.adl_psql_server.id
}

output "server_name" {
  value = azurerm_postgresql_flexible_server.adl_psql_server.name
}

output "postgres_password" {
  value = random_password.postgres_password.result
  sensitive = true
}

