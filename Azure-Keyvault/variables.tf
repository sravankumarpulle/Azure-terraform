variable "tags" {
  default = {
    Application = "AdaniIC",
    BU = "IC",
    Classification = "Silver",
    Criticality = "Low",
    Env = "QA",
    Owner = "Parin Shah",
    Role = "Application",
    IAC = "Terraform"
  }
  type    = map(string)
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "vnet_rg_name" {
  type = string
}

variable "pe_subnet_name" {
  type = string
}


variable "key_vault_name" {
  type = string
}
variable "subscription_id" {}


