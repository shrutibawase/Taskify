resource "azurerm_virtual_network" "networks" {
  for_each            = var.networking

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  # Exactly one of address_space or ip_address_pool must be provided
  address_space       = lookup(each.value, "address_space", null)
  tags                = lookup(each.value, "tags", {})

  dynamic "ddos_protection_plan" {
    for_each = lookup(each.value, "ddos_protection_plan_id", null) == null ? [] : [lookup(each.value, "ddos_protection_plan_id", null)]
    content {
      # ddos_protection_plan expects an id block value
      id = ddos_protection_plan.value
      enable = true
    }
  }

  # Optional subnet block
  dynamic "subnet" {
    for_each = lookup(each.value, "subnets", {})
    content {
      name                 = lookup(subnet.value, "name", null)
      address_prefixes     = lookup(subnet.value, "address_prefixes", [])
      # optional attribute supported in the variable definition
      default_outbound_access_enabled = lookup(subnet.value, "default_outbound_access_enabled", null)
    }
  }
}