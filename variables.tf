variable "bridges" {
  description = "List of bridges present on your Mikrotik device"
  type = list(object({
    name           = string
    pvid           = number
  }))
}

variable "bonds" {
  description = "bond configurations"
  type = list(object({
    name                  = string
    comment               = string
    slaves                = list(string)
    lacp_rate             = string
    mode                  = string
    transmit_hash_policy  = string
  }))
  default = []
}

variable "CAPsMAN" {
  description = "Enable Capsman"
  type        = bool
  default     = false
}

variable "CAPsMAN_interfaces" {
  description = "list of interfaces where CAPsMAN listens for CAP devices"
  type        = list(string)
  default     = []
}

variable "default_cidr" {
  description = "Default cidr used as base for all subnets"
  type        = string
  default     = ""
}

variable "dhcp_range" {
  description = "range used for DHCP server"
  type        = list(number)
  default     = []
}

variable "dhcp_options" {
  description = "list containing dhcp options"
  type        = list(object({
    name      = string
    code      = number
    value     = string
  }))
  default = []
}

variable "dhcp_option_sets" {
  description = "list containing dhcp option sets"
  type        = list(object({
    name      = string
    options   = string
  }))
  default     = []
}

variable "dns_records" {
  description = "dns records"
  type        = list(object({
    name      = string
    address   = string
    type      = string
  }))
  default = []
}

variable "edge" {
  description = "is this an edge device or not"
  type        = bool
  default     = false
}

variable "enable_dhcp" {
  description = "enable dhcp"
  type        = bool
  default     = true
}
variable "enable_firewall" {
  description = "enable firewall"
  type        = bool
  default     = true
}

variable "enable_wifi" {
  description = "enable wifi"
  type        = bool
  default     = true
}

variable "enable_wireguard" {
  description = "enable wireguard"
  type        = bool
  default     = true
}

variable "homelab_password" {
  type      = string
  sensitive = true
}

variable "homelab_host_url" {
  type      = string
}

variable "pxe_options" {
  type = list(object({
    interface   = string
    next_server = string
    bootfile    = optional(string)
  }))
  default = []
}

variable "switch1_password" {
  type      = string
  sensitive = true
}

variable "switch1_host_url" {
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
    dhcp           = optional(bool, false)
    dhcp_options   = optional(string, null)
  }))
  default = []
}

variable "vlan_address_creation" {
  description = "Automatically create addresses for a vlan"
  type = bool
  default = true
}

variable "vpn_interface_address" {
  type = string
  description = "address inside the vpn subnet. Base subnet + vpn_interface_subnet is used to compile complete subnet in cidr notation"
  default = ""
}
variable "vpn_interface_subnet" {
  type = string
  description = "subnet used for the VPN network"
  default = ""
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
  default = {
    interface   = ""
    dhcp        = false
  }
}

variable "wan_allowed" {
  description = "List of interfaces with WAN access"
  type        = list(string)
  default     = []
}

variable "wan_ip" {
  type        = string
  description = "WAN IP"
  default     = ""
}


variable "wifi_config-24ghz" {
  description = "list of wifi configurations, first in list is used as primary, for actual config select the datapath/channel/security template name"
  type        = list(object({
    name      = string
    datapath  = string
    channel   = string
    ssid      = string
    security  = string
  }))
  default     = []
}

variable "wifi_config-5ghz" {
  description = "list of wifi configurations, first in list is used as primary, for actual config select the datapath/channel/security template name"
  type        = list(object({
    name      = string
    datapath  = string
    channel   = string
    ssid      = string
    security  = string
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
  }))
  default = []
}

variable "wifi_country" {
  description = "your location, for wifi configuration"
  type        = string
  default     = ""
}

variable "wifi_datapath" {
  description         = "list of datapath configuration templates"
  type                = list(object({
    name              = string
    vlan_id           = string
    client_isolation  = bool
    bridge            = string
  }))
  default = []
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
  default = []
}

variable "wifi_traffic_processing" {
  description             = "input for traffic-processing in datapath"
  type                    = string
  default                 = ""
}
