resource "azurerm_container_group" "mycgr" {
  name                = "cgr-${convention}"
  location            = "${azurerm_resource_group.mcit.location}"
  resource_group_name = "${azurerm_resource_group.mcit.name}"
  ip_address_type     = "public"
  dns_name_label      = "aci-label"
  os_type             = "Linux"

  container {
    name   = "hello-world"
    image  = "microsoft/aci-helloworld:latest"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 443
      protocol = "TCP"
    }
  }

  container {
    name   = "sidecar"
    image  = "microsoft/aci-tutorial-sidecar"
    cpu    = "0.5"
    memory = "1.5"
  }

  tags = {
    environment = "${var.tag}"
  }
}