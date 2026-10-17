rg_names = {
  rg-1 = {
    name     = "rg-axion"
    location = "centralindia"
  }


}

vnet_names = {

  vnet-1 = {
    name                = "axion-vnet"
    location            = "centralindia"
    resource_group_name = "rg-axion"
    address_space       = ["10.0.0.0/16"]
  }
}

subnet_names = {
  subnet-1 = {
    name                 = "frontend-subnet-1"
    resource_group_name  = "rg-axion"
    virtual_network_name = "axion-vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet-2 = {
    name                 = "backend-subnet-1"
    resource_group_name  = "rg-axion"
    virtual_network_name = "axion-vnet"
    address_prefixes     = ["10.0.2.0/24"]
  }
  subnet-3 = {
    name                 = "database-subnet-1"
    resource_group_name  = "rg-axion"
    virtual_network_name = "axion-vnet"
    address_prefixes     = ["10.0.3.0/24"]
  }
}
pip_names = {
  pip-1 = {
    name                = "pip-1"
    resource_group_name = "rg-axion"
    location            = "centralindia"
    allocation_method   = "Static"
  }

  pip-2 = {
    name                = "pip-2"
    resource_group_name = "rg-axion"
    location            = "centralindia"
    allocation_method   = "Static"
  }
  pip-3 = {
    name                = "pip-3"
    resource_group_name = "rg-axion"
    location            = "centralindia"
    allocation_method   = "Static"
  }

}
nsg_names = {
  nsg-1 = {
    name                = "frontend-nsg-1"
    location            = "centralindia"
    resource_group_name = "rg-axion"

    rule_name                  = "frontend-22"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  nsg-2 = {
    name                = "backend-nsg"
    location            = "centralindia"
    resource_group_name = "rg-axion"

    rule_name                  = "backend-22"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"

  }


  nsg-3 = {
    name                = "database-nsg"
    location            = "centralindia"
    resource_group_name = "rg-axion"

    rule_name                  = "database-22"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}


vm_names = {

  vm-1 = {
    # key=value
    name                          = "frontend-vm-1"
    location                      = "centralindia"
    resource_group_name           = "rg-axion"
    network_interface_ids         = "nic-1"
    vm_size                       = "Standard_DC1ds_v3"
    nic_name                      = "nic-1"
    ip_name                       = "ip-name-1"
    sub_name                      = "frontend-subnet-1"
    vnet_name                     = "axion-vnet"
    private_ip_address_allocation = "Dynamic"
    disk_names                    = "osdisk-vm-1"
    pips_names                    = "pip-1"
    nsg_data                      = "frontend-nsg-1"

    publisher         = "Canonical"
    offer             = "0001-com-ubuntu-server-jammy"
    sku               = "22_04-lts-gen2"
    version           = "latest"
    computer_name     = "froentend-vm"
    admin_username    = "azureuser"
    admin_password    = "azureuser@123"
    disk_names        = "osdisk-vm-1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"





  }
  vm-2 = {
    name                          = "backend-vm-1"
    location                      = "centralindia"
    resource_group_name           = "rg-axion"
    network_interface_ids         = "nic-2"
    vm_size                       = "Standard_DC1ds_v3"
    nic_name                      = "nic-2"
    ip_name                       = "ip-name-2"
    sub_name                      = "frontend-subnet-1"
    vnet_name                     = "axion-vnet"
    private_ip_address_allocation = "Dynamic"

    pips_names = "pip-2"
    nsg_data   = "backend-nsg"

    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"

    computer_name  = "backend-vm"
    admin_username = "azureuser"
    admin_password = "azureuser@123"

    disk_names        = "osdisk-vm-2"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"


  }
  vm-3 = {
    name                          = "database-vm-1"
    location                      = "centralindia"
    resource_group_name           = "rg-axion"
    network_interface_ids         = "nic-3"
    vm_size                       = "Standard_DC1ds_v3"
    nic_name                      = "nic-3"
    ip_name                       = "ip-name-3"
    sub_name                      = "frontend-subnet-1"
    vnet_name                     = "axion-vnet"
    private_ip_address_allocation = "Dynamic"
    disk_names                    = "osdisk-vm-3"
    pips_names                    = "pip-3"
    nsg_data                      = "database-nsg"

    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"

    computer_name  = "database-vm"
    admin_username = "azureuser"
    admin_password = "azureuser@123"

    disk_names        = "osdisk-vm-3"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
}


postgresql_server = {

  psql-1 = {

    name                          = "psqlflexibleserve-1"
    resource_group_name           = "rg-axion"
    location                      = "centralindia"
    version                       = "18"
    public_network_access_enabled = true
    administrator_login           = "psqladmin"
    administrator_password        = "psqladmin@123"
    zone                          = "1"

    storage_mb   = 32768
    storage_tier = "P4"

    sku_name = "B_Standard_B1ms"

     db-name      = "axiondb"

  }
}
