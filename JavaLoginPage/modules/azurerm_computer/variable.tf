

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