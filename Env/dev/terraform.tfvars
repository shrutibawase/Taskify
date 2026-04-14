rg = {
  "rg1" = {
    name     = "todo-rg1"
    location = "East US"
  }
}

vnet = {
  "vnet1" = {
    vnet_name     = "todo-vnet"
    vnet_location = "East US"
    vnet_rg       = "todo-rg1"
    address_space  = ["10.0.0.0/16"]
    dns_servers    = ["8.8.8.8"]
    }
}

subnet = {
  "subnet1" = {
    subnet_name = "todo-subnet1"
    subnet_rg = "todo-rg1"
    subnet_vnet = "todo-vnet"
    subnet_address_prefix = ["10.0.1.0/24"]
  }
}

public_ip = {
  "pub_ip1" = {
    public_ip_name     = "todo-public-ip"
    public_ip_location = "East US"
    public_ip_rg       = "todo-rg1"
  }
}

nic_vm = {
  "nic_vm" = {
    nic_name     = "todo-nic"
    nic_location = "East US"
    nic_rg       = "todo-rg1"

    # ✅ Subnet (for data source)
    subnet_name = "todo-subnet1"
    vnet_name   = "todo-vnet"
    vnet_rg     = "todo-rg1"

    # ✅ Public IP (for data source)
    public_ip_name = "todo-public-ip"
    public_ip_rg   = "todo-rg1"

    # ✅ Key Vault (for data source)
    keyvault_name = "keyvault12dev001"
    keyvault_rg   = "todo-rg1"

    # VM
    vm_name     = "todo-vm"
    vm_rg       = "todo-rg1"
    vm_location = "East US"
    vm_size     = "Standard_B2s"

    vm_image_publisher = "Canonical"
    vm_image_offer     = "UbuntuServer"
    vm_image_sku       = "18.04-LTS"
    vm_image_version   = "latest"
  }
}

mysql_server = {
  "mysql_server1" = {
    mysql_server_name              = "todo-mysql-server133"
    mysql_server_rg                = "todo-rg1"
    mysql_server_location          = "Central US"
    mysql_server_version           = "12.0"
    administrator_login            = "adminuser"
    administrator_login_password   = "P@ssw0rd1234"
  }
}

mysql_db = {
  "db1" = {
    mysql_db_name      = "todo-db1"
    mysql_db_server_id = "/subscriptions/515776c8-b3a8-4862-9224-9442d9a6ebb9/resourceGroups/todo-rg1/providers/Microsoft.Sql/servers/todo-mysql-server133"
  }
}

keyvault = {
  "keyvault1" = {
    keyvault_name     = "keyvault12dev001"
    keyvault_location = "East US"
    keyvault_rg       = "todo-rg1"
  }
}