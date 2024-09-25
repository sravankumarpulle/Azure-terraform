output "id" {
  value = azurerm_kusto_cluster.cluster.id
}

output "name" {
  value = azurerm_kusto_cluster.cluster.name
}

output "uri" {
  value = azurerm_kusto_cluster.cluster.uri
}

output "principal_id" {
  value = azurerm_kusto_cluster.cluster.identity.0.principal_id
}
