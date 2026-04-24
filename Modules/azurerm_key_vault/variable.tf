variable "keyvault" {
  description = "A map of key vaults to create"
  type        = map(object({
    keyvault_name     = string
    keyvault_location = string
    keyvault_rg       = string
  }))
  
}
