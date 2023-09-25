resource "azurerm_kubernetes_cluster" "myk8scluster" {
  for_each            = { for student in local.name_students : student => student }
  name                = "clk8s-${convention}-${each.key}"
  location            = azurerm_resource_group.mcit.location
  resource_group_name = azurerm_resource_group.mcit.name
  dns_prefix          = "${prefix}-dns"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  service_principal {
    client_id     = "00000000-0000-0000-0000-000000000000"
    client_secret = "00000000000000000000000000000000"
  }

  tags = {
    Environment = "${var.tags}"
  }
}