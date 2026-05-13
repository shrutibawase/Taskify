data "azurerm_subnet" "subid" {
  for_each = var.network_interfaces
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.rg_name
}

data "azurerm_public_ip" "pubid" {
  for_each = var.network_interfaces
  name                = each.value.pub_name
  resource_group_name = each.value.pubrg_name
}

// data "azurerm_key_vault" "KeyvaultUP" {
//   for_each = var.linux_virtual_machine
//   name                = each.value.kv_name
//   resource_group_name = each.value.resource_group_name
// }

// data "azurerm_key_vault_secret" "username" {
//   for_each = var.linux_virtual_machine
//   name         = "vm-username"
//   key_vault_id = data.azurerm_key_vault.KeyvaultUP[each.key].id
// }

// data "azurerm_key_vault_secret" "password" {
//   for_each = var.linux_virtual_machine
//   name         = "vm-password"
//   key_vault_id = data.azurerm_key_vault.KeyvaultUP[each.key].id
// }