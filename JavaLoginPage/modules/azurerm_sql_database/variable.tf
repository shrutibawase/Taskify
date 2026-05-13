variable "mysql_database" {
  type = map(object({
    name                = string
    resource_group_name = string
    server_name         = string
  }))
}