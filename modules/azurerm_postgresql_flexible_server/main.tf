resource "azurerm_postgresql_flexible_server" "example" {
  for_each = var.postgresql_server

  name                          = each.value.name
  resource_group_name           = each.value.resource_group_name
  location                      = each.value.location
  version                       = each.value.version
  public_network_access_enabled = each.value.public_network_access_enabled
  administrator_login           = each.value.administrator_login
  administrator_password        = each.value.administrator_password
  zone                          = each.value.zone
  storage_mb                    = each.value.storage_mb
  storage_tier                  = each.value.storage_tier
  sku_name                      = each.value.sku_name
}


resource "azurerm_postgresql_flexible_server_database" "db" {
  for_each = var.postgresql_server

  name      = each.value.db-name
  server_id = azurerm_postgresql_flexible_server.example[each.key].id
  collation = "en_US.utf8"
  charset   = "UTF8"
}