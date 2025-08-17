variable "bridges" {
  description = "List of bridges present on your Mikrotik device"
  type = list(object({
    name           = string
    pvid           = number
  }))
}

variable "default_cidr" {
  description = "Default cidr used as base for all subnets"
  type        = string
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

variable "wan" {
  description = "Configure interface as WAN port"
  type = object({
    interface   = string
    dhcp        = bool
  })
}

variable "wifi_config" {
  description = "list of wifi configurations, first in list is used as primary, for actual config select the datapath/channel/security template name"
  type        = list(object({
    name      = string
    datapath  = string
    channel   = string
    security  = string
    ssid      = string
  }))
  default     = []
}

variable "wifi_channel" {
  description = "list of wifi channel configuration templates"
  type                = list(object({
    name              = string
    band              = string
    channel_width     = string
    skip_dfs          = string
    reselect_interval = string
    frequency         = list(number)
  }))
}

variable "wifi_country" {
  description = "your location, for wifi configuration"
  type        = string
}
variable "wifi_passwords" {
  description = "map of password in secrets.auto.tfvars"
  type        = map(string)
  sensitive   = true
  default     = {}
}
