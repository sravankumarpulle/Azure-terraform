resource "azurerm_postgresql_flexible_server_database" "adl_psql" {
  name      = "psql_db"
  server_id = azurerm_postgresql_flexible_server.adl_psql_server.id
  charset   = var.charset
  collation = var.collation
}

resource "azurerm_postgresql_flexible_server_database" "adani_ic_Qa" {
  name      = var.postgres_db_name #"adaniicQaConfig"
  server_id = azurerm_postgresql_flexible_server.adl_psql_server.id
  charset   = var.charset
  collation = var.collation
}

resource "azurerm_postgresql_flexible_server_database" "adani_amm" {
  name      = "adani_amm"
  server_id = azurerm_postgresql_flexible_server.adl_psql_server.id
  charset   = var.charset
  collation = var.collation
}

resource "azurerm_postgresql_flexible_server_database" "iot_db" {
  name      = "iot_db"
  server_id = azurerm_postgresql_flexible_server.adl_psql_server.id
  charset   = var.charset
  collation = var.collation
}

resource "azurerm_postgresql_flexible_server_database" "db_Adani_IC" {
  name      = "db_Adani_IC"
  server_id = azurerm_postgresql_flexible_server.adl_psql_server.id
  charset   = var.charset
  collation = var.collation
}

resource "azurerm_postgresql_flexible_server_database" "pwc_ic" {
  name      = "pwc_ic"
  server_id = azurerm_postgresql_flexible_server.adl_psql_server.id
  charset   = var.charset
  collation = var.collation
}

resource "azurerm_postgresql_flexible_server_database" "sa-uc-mobileapp" {
  name      = "sa-uc-mobileapp"
  server_id = azurerm_postgresql_flexible_server.adl_psql_server.id
  charset   = var.charset
  collation = var.collation
}

