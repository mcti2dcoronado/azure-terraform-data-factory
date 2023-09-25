resource "azurerm_postgresql_server" "mypsql" {
  name                = "psql-${var.convention}"
  location            = "${azurerm_resource_group.mcit.location}"
  resource_group_name = "${azurerm_resource_group.mcit.name}"

  sku_name = "B_Gen5_2"

  storage_profile {
    storage_mb            = 5120
    backup_retention_days = 7
    geo_redundant_backup  = "Disabled"
  }

  administrator_login          = ${var.administrator_login}
  administrator_login_password = "${var.administrator_login_password}"
  version                      = "9.5"
  ssl_enforcement              = "Enabled"
}

resource "azurerm_postgresql_database" "mydb" {
  name                = "db-${var.convention}"
  resource_group_name = "${azurerm_resource_group.mcit.name}"
  server_name         = "${azurerm_postgresql_server.mypsql.name}"
  charset             = "UTF8"
  collation           = "English_United States.1252"
}