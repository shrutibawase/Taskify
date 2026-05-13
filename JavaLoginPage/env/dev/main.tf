module "azurerm_resource_group" {
  source = "../../modules/azurerm_resource_group"
  resource_groups = var.resource_groups
}

module "azurerm_virtual_network" {
  source = "../../modules/azurerm_networking"
  networking = var.networking
}

module "azurerm_public_ip" {
  source = "../../modules/azurerm_publicIp"
  public_ips = var.public_ips
}

module "azurerm_linux_virtual_machine" {
  depends_on = [ module.azurerm_virtual_network, module.azurerm_public_ip ]
  source = "../../modules/azurerm_computer"
  network_interfaces = var.network_interfaces
  linux_virtual_machine = var.linux_virtual_machine
}

module "azurerm_key_vault" {
  source = "../../modules/azurerm_key_vault"
  key_vaults = var.key_vaults
}

module "azurerm_mssql_server" {
  depends_on = [ module.azurerm_resource_group ]
  source = "../../modules/azurerm_sql_server"
  sql_servers = var.sql_servers
}

module "azurerm_mysql_database" {
  depends_on = [ module.azurerm_mssql_server ]
  source = "../../modules/azurerm_sql_database"
  mysql_database = var.mysql_database
}