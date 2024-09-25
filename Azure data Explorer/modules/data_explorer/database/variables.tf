variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "cluster_name" {
  type = string
}

variable "hot_cache_period" {
  type = string
}

variable "soft_delete_period" {
  type = string
}
variable "keyvault_id" {
  type = string
}
