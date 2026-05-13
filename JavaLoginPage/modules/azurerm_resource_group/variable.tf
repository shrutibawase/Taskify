variable "resource_groups" {
  description = "Map of Azure Resource Groups to be created"
  type = map(object({
    name       = string
    location   = string
  }))
}