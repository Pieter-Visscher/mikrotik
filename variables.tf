variable "bridges" {
  description = "List of bridges present on your Mikrotik device"
  type = list(object({
    name           = string
    pvid           = number
  }))
}

variable "homelab_password" {
  type      = string
  sensitive = true
}

variable "homelab_host_url" {
  type      = string
}

variable "test_password" {
  type      = string
  sensitive = true
}

variable "test_host_url" {
  type      = string
}

variable "vlans" {
  description = "List of vlans present on your Mikrotik device"
  type = list(object({
    name           = string
    comment        = string
    interface      = string
    id             = number
    tagged_ports   = list(string)
    untagged_ports = list(string)
  }))
  default = []
}

variable "default_cidr" {
  description = "Default cidr used as base for all subnets"
  type        = string
}

variable "wan" {
  description = "Configure interface as WAN port"
  type = object({
    interface   = string
    dhcp        = bool
  })
}

