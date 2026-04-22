module "azurerm_resource_group" {
  source = "../../Modules/azurerm_resource_group"
  rg = var.rg  # variable = dev/module
}

module "azurerm_virtual_network" {
  depends_on = [ module.azurerm_resource_group ]
  source = "../../Modules/azurerm_virtual_network"
  vnet = var.vnet
}

module "azurerm_subnet" {
  depends_on = [ module.azurerm_virtual_network ]
  source = "../../Modules/azurerm_subnet"
  subnet = var.subnet
}

module "azurerm_public_ip" {
  depends_on = [ module.azurerm_resource_group ]
  source = "../../Modules/azurerm_public_ip"
  public_ip = var.public_ip
}

module "azurerm_virtual_machine" {
  depends_on = [ module.azurerm_resource_group, module.azurerm_virtual_network, module.azurerm_subnet, module.azurerm_public_ip, module.azurerm_keyvault ]
  source = "../../Modules/azurerm_virtual_machine"
  nic_vm = var.nic_vm
}

module "azurerm_mssql_server" {
  depends_on = [ module.azurerm_resource_group ]
  source = "../../Modules/azurerm_sql_server"
  mysql_server = var.mysql_server
}

module "azurerm_mysql_database" {
  depends_on = [ module.azurerm_mssql_server ]
  source = "../../Modules/azurerm_mysql_database"
  mysql_db = var.mysql_db

}

module "azurerm_keyvault" {
  depends_on = [ module.azurerm_resource_group ]
  source = "../../Modules/azurerm_key_vault"
  keyvault = var.keyvault
}