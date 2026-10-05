variable "shortname" {
  type        = string
  description = "Kortnavnet ditt. Brukes i alle ressursnavn så de er unike i den delte tenanten"
}

variable "project" {
  type        = string
  description = "Prosjektnavn. Første ledd i navnekonvensjonen"
}

variable "environment" {
  type        = string
  description = "Miljøet som rulles ut, f.eks. dev eller test. Avgjør også hvilken network-state som leses"
}

variable "location" {
  type        = string
  default     = "norwayeast"
  description = "Azure-regionen. Må være den samme som network-stacken, ellers kan ikke NIC-en bruke subnettet"
}

variable "backend_resource_group_name" {
  type        = string
  description = "Resource group der state-lagringen ligger. Brukes til å lese network-stackens state"
}

variable "backend_storage_account_name" {
  type        = string
  description = "Storage account der state-filene ligger"
}

variable "backend_container_name" {
  type        = string
  description = "Containeren i storage account-et der state-filene ligger"
}

variable "nic_subnet_key" {
  type        = string
  default     = "app"
  description = "Navnet på subnettet NIC-en skal kobles til. Slås opp i subnet_ids fra network-stacken"
}