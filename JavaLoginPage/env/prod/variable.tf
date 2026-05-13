variable "resource_groups" {
  description = "Map of Azure Resource Groups to be created"
  type = map(object({
    name       = string
    location   = string
    managed_by = optional(string)
    tags       = optional(map(string))
  }))
}

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
    })))
  }))
}

//public IP Variable
variable "public_ips" {
  description = "Map of Public IP configurations"
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    allocation_method   = string

    zones                    = optional(list(string))
    ddos_protection_mode      = optional(string)
    ddos_protection_plan_id   = optional(string)
    domain_name_label         = optional(string)
    # domain_name_label_scope   = optional(string)
    edge_zone                 = optional(string)
    idle_timeout_in_minutes   = optional(number)
    ip_tags                   = optional(map(string))
    ip_version                = optional(string)
    public_ip_prefix_id       = optional(string)
    reverse_fqdn              = optional(string)
    sku                       = optional(string)
    sku_tier                  = optional(string)
    tags                      = optional(map(string))
  }))
}

// NIC Variable
variable "network_interfaces" {
  type = map(object({
    name = string
    location = string
    resource_group_name = string
    subnet_name          = string
    virtual_network_name = string
    rg_name              = string
    pub_name             = string
    pubrg_name           = string
  }))
}

// VM variable 
variable "linux_virtual_machine" {
  type = map(object({
    name = string
    resource_group_name = string
    location = string
    size = string
    admin_username = string
    admin_password = string
    kv_name = string
  }))
}

variable "key_vaults" {
  type = map(object({
    kv_name                = string
    location            = string
    resource_group_name = string
  }))
}

variable "sql_servers" {
  type = map(object({
    name = string
    resource_group_name = string
    location = string
    administrator_login = string
    administrator_login_password = string
  }))
}

variable "mysql_database" {
  type = map(object({
    name                = string
    resource_group_name = string
    server_name         = string
  }))
}