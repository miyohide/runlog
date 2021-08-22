terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }

  required_version = ">= 0.14.9"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-railsapp"
  location = "japaneast"
}

data "azurerm_key_vault" "keyvault" {
  name = "keyvault_name"
  resource_group_name = "keyvault_rg"
}

data "azurerm_key_vault_secret" "database-user" {
  name = "database_user"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}

data "azurerm_key_vault_secret" "database-password" {
  name = "database_password"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}

resource "azurerm_postgresql_server" "pg-server" {
  name = "postgresql_server_name"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location

  administrator_login = data.azurerm_key_vault_secret.database-user.value
  administrator_login_password = data.azurerm_key_vault_secret.database-password.value

  sku_name = "B_Gen5_1"
  version = "11"

  storage_mb = 5120

  public_network_access_enabled = true
  ssl_enforcement_enabled = true
  ssl_minimal_tls_version_enforced = "TLS1_2"
}

resource "azurerm_postgresql_database" "pg-db" {
  name = "app_production"
  resource_group_name = azurerm_resource_group.rg.name
  server_name = azurerm_postgresql_server.pg-server.name
  charset = "utf8"
  collation = "Japanese_Japan.932"
}
