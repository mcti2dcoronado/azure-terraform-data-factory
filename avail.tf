resource "azurerm_availability_set" "myavail" {
  name                = "avail-${var.convention}"
  location            = "${azurerm_resource_group.mcit.location}"
  resource_group_name = "${azurerm_resource_group.mcit.name}"

  tags = {
    environment = "${var.tags}"
  }
}