module "rg" {
  source   = "../../modules/azurerm_resource_group"
  rg_names = var.rg_names
}

module "vnet" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_virtual_network"
  vnet_names = var.vnet_names
}

module "subnet" {
  depends_on   = [module.vnet]
  source       = "../../modules/azurerm_subnet"
  subnet_names = var.subnet_names
}

module "pip" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_public_ip"
  pip_names  = var.pip_names
}

module "vm" {
  depends_on = [module.subnet, module.pip]

  source   = "../../modules/azurerm_virtual_machine"
  vm_names = var.vm_names
}


module "nsg" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_network_security_group"
  nsg_names  = var.nsg_names

}

module "psql" {
  depends_on        = [module.rg]
  source            = "../../modules/azurerm_postgresql_flexible_server"
  postgresql_server = var.postgresql_server

}