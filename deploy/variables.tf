variable "rails_master_key" {
  type = string
}

variable "postgresql-admin-login" {
  type = string
}

variable "postgresql-admin-password" {
  type = string
}

variable "postgresql-version" {
  type = string
  default = "11"
}

variable "postgresql-sku-name" {
  type = string
  default = "B_Gen5_1"
}

variable "postgresql-storage" {
  type = string
  default = "5120"
}
