locals {
    name_students = ["Douglass","Ajebit","Yan","Oladipupo", "Arunthavaratnam", "Jade", "Olarewaju"]
}

resource "azurerm_resource_group" "mcit" {
  name     = "rg-${var.convention}"
  location = var.location
}