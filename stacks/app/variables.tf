variable "shortname" {
  type        = string
  description = "mitt navn, definerer tennant"
}

variable "location" {
  type        = string
  default     = "norwayeast"
  description = "Azure-regionen ressursene opprettes i."
}

variable "environment" {
    type = string
    description = "sier hvilket miljø (dev/test). skiller instanser av stack"
}

variable "project" {
    type = string
    description = "prosjekt navn (kommer til å si oblig1)"
}
