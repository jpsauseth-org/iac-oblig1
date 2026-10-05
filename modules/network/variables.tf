variable "base_name" {
  type = string
  description = "hoved navn for alle resurser"
}

variable "rg_name" {
  type = string
  description = "navn for ressurs grupper"
}

variable "location" {
  type = string
  description = "lokasjon forklarer (westeurope)"
}

variable "address_space" {
  type = string
  description = "adresser å ta fra med cidr"
}

variable "subnets" {
  type = map(number)
  description = "newbits og netum for å lage og fordele adresser"
}

variable "tags" {
  type = map(string)
  description = "forklarende merkelapper"
}