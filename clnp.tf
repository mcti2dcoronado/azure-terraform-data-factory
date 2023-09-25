resource "azurerm_kubernetes_cluster" "myk8s" {
  name                = "k8s-${var.convention}"
  location            = azurerm_resource_group.mcit.location
  resource_group_name = azurerm_resource_group.mcit.name
  dns_prefix          = "${var.prefix}-dns"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  service_principal {
    client_id     = "00000000-0000-0000-0000-000000000000"
    client_secret = "00000000000000000000000000000000"
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "k8sclnpool" {
  name                  = "internal"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.myk8s.id
  vm_size               = "Standard_DS2_v2"
  node_count            = 1
}