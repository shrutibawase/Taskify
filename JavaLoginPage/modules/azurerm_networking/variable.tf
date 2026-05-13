variable "networking" {
  description = "Map of Virtual Network configurations"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = optional(list(string))
    tags                = optional(map(string))
    subnets = optional(map(object({
      name             = string
      address_prefixes = list(string)
      default_outbound_access_enabled = optional(bool)
    })))
  }))
}