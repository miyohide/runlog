variable "keyvault_name" {
  type = string
}

variable "keyvault_resource_group" {
  type = string
}

variable "postgresql_server_name" {
  type = string
}

variable "postgresql_version" {
  type = string
  default = "11"
}

variable "postgresql_sku_name" {
  type = string
  default = "B_Gen5_1"
}

variable "postgresql_storage" {
  type = number
  default = 5120
}
