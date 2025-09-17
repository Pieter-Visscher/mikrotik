variable "bridges" {
  description = "List of bridges present on your Mikrotik device"
  type = list(object({
    name           = string
    pvid           = number
  }))
}

variable "CAPsMAN" {
  description = "Enable Capsman"
  type        = bool
  default     = false
}

variable "CAPsMAN_interfaces" {
  description = "list of interfaces where CAPsMAN listens for CAP devices"
  type        = list(string)
}

variable "default_cidr" {
  description = "Default cidr used as base for all subnets"
  type        = string
}

variable "dhcp_range" {
  description = "range used for DHCP server"
  type        = list(number)
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
    dhcp           = bool
  }))
  default = []
}

variable "vpn_interface_address" {
  type = string
  description = "address inside the vpn subnet. Base subnet + vpn_interface_subnet is used to compile complete subnet in cidr notation"
}
variable "vpn_interface_subnet" {
  type = string
  description = "subnet used for the VPN network"
}

variable "vpn_peers" {
  type  = list(object({
    name        = string
    psk         = string
    public_key  = string
    private_key = string
    subnets     = list(string)
    id          = number
    comment     = string
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

variable "wan_allowed" {
  description = "List of interfaces with WAN access"
  type        = list(string)
}

variable "wan_ip" {
  type        = string
  description = "WAN IP"
}


variable "wifi_config" {
  description = "list of wifi configurations, first in list is used as primary, for actual config select the datapath/channel/security template name"
  type        = list(object({
    name      = string
    datapath  = string
    channel   = string
    ssid      = string
  }))
  default     = []
}

variable "wifi_channel" {
  description         = "list of wifi channel configuration templates"
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

variable "wifi_datapath" {
  description         = "list of datapath configuration templates"
  type                = list(object({
    name              = string
    vlan_id           = string
    client_isolation  = bool
    bridge            = string
  }))
}

variable "wifi_passwords" {
  description = "map of password in secrets.auto.tfvars"
  type        = map(string)
  sensitive   = true
  default     = {}
}

variable "wifi_security" {
  description             = "security settings"
  type                    = list(object({
    name                  = string
    authentication_types  = list(string)
    ft                    = bool
    ft-over-ds            = bool
    management_protection = string
  }))
}
