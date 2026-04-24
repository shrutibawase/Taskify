variable "rg" {
  type = map(object({
    name     = string
    location = string
  }))
}

variable "vnet" {
  description = "Virtual network details"
  type = map(object({
    vnet_name     = string
    vnet_location = string
    vnet_rg       = string
    address_space = list(string)
    dns_servers   = list(string)
  }))
}

variable "subnet" {
  description = "value"
  type = map(object({
    subnet_name           = string
    subnet_rg             = string
    subnet_vnet           = string
    subnet_address_prefix = list(string)
  }))
}

variable "public_ip" {
  description = "Public IP details"
  type = map(object({
    public_ip_name     = string
    public_ip_location = string
    public_ip_rg       = string
  }))
}

variable "nic_vm" {
  type = map(object({
    nic_name     = string
    nic_location = string
    nic_rg       = string

    # Subnet (data source)
    subnet_name = string
    vnet_name   = string
    vnet_rg     = string

    # Public IP (data source)
    public_ip_name = string
    public_ip_rg   = string

    # Key Vault (data source)
    keyvault_name = string
    keyvault_rg   = string

    # VM
    vm_name     = string
    vm_rg       = string
    vm_location = string
    vm_size     = string

    vm_image_publisher = string
    vm_image_offer     = string
    vm_image_sku       = string
    vm_image_version   = string
  }))
}

variable "mysql_server" {
  description = "A map of MySQL server configurations"
  type = map(object({
    mysql_server_name            = string
    mysql_server_rg              = string
    mysql_server_location        = string
    mysql_server_version         = string
    administrator_login          = string
    administrator_login_password = string
  }))
}

variable "mysql_db" {
  description = "A map of MySQL database configurations"
  type = map(object({
    mysql_db_name      = string
    mysql_db_server_id = string
  }))
}

variable "keyvault" {
  description = "A map of key vaults to create"
  type = map(any({
    keyvault_name     = string
    keyvault_location = string
    keyvault_rg       = string
    
  }))

}
