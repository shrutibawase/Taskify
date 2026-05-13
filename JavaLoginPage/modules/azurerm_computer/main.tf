

resource "azurerm_network_interface" "example" {
  for_each            = var.network_interfaces
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  # Each network interface requires at least one ip_configuration block. The
  # ip configuration values are passed in via the module input `network_interfaces`.
  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subid[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = data.azurerm_public_ip.pubid[each.key].id
  }
}

#VM 
resource "azurerm_linux_virtual_machine" "example" {
  for_each            = var.linux_virtual_machine
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = each.value.admin_username  //data.azurerm_key_vault_secret.username[each.key].value
  admin_password      = each.value.admin_password  //data.azurerm_key_vault_secret.password[each.key].value 
  disable_password_authentication = false
  
  network_interface_ids = [
    azurerm_network_interface.example[each.key].id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
