data "azurerm_key_vault" "keyvault" {
  name = "kv-hogehoge"
  resource_group_name = "rg-keyvault"
}

data "azurerm_key_vault_secret" "database-user" {
  name = "app-database-user"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}

output "database-user" {
  value = data.azurerm_key_vault_secret.database-user.value
  sensitive = true
}
