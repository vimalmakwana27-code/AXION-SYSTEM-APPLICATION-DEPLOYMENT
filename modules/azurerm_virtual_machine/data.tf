data "azurerm_subnet" "subnet" {
  for_each = var.vm_names
  name                 = each.value.sub_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "pip-data" {
  for_each = var.vm_names
  name                = each.value.pips_names
  resource_group_name = each.value.resource_group_name
}

data "azurerm_network_security_group" "nsg-data" {
  for_each = var.vm_names
  name                =each.value.nsg_data
  resource_group_name = each.value.resource_group_name
}