
output "name" {
  description = "Specifies the name of the container registry."
  value       = azurerm_redis_cache.adl_redis.name
}

output "id" {
  value = azurerm_redis_cache.adl_redis.id
}

output "hostname" {
  value       = azurerm_redis_cache.adl_redis.hostname
  description = "The Hostname of the Redis Instance"
}
