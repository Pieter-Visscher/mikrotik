bridges = [
  {
    name            = "bridge"
    pvid            = 1
  }
]

edge = true

CAPsMAN            = true
CAPsMAN_interfaces = ["vlan_51"]

default_cidr = "10.0.0.0/24"
dhcp_range   = [200, 250]

dhcp_options = [
  {
    name            = "pxe boot tftp server"
    code            = 66
    value           = "s'10.1.100.17'"
  },
  {
    name            = "undionly.kpxe"
    code            = 67
    value           = "s'ipxe.efi'"
  },
  {
    name            = "talos ipxe"
    code            = 67
    value           = "s'http://pxe.pieter.fish/talos/boot.ipxe'"
  },
  {
    name            = "talos custom ipxe"
    code            = 210
    value           = "s'http://pxe.pieter.fish/talos/boot.ipxe'"
  }
]

dhcp_option_sets = [
  {
    name            = "talos"
    options         = "talos ipxe,pxe boot tftp server"
  },
  {
    name            = "ipxe"
    options         = "undionly.kpxe,pxe boot tftp server,talos custom ipxe"
  }
]

vlans = [
  {
    name            = "vlan_50"
    comment         = "management"
    interface       = "bridge"
    id              = 50
    tagged_ports    = ["ether1", "sfp-sfpplus1"]
    untagged_ports  = ["ether7", "ether3"]
    dhcp            = true
    dhcp_options    = null
  },
  {
    name            = "vlan_51"
    comment         = "ap-management"
    interface       = "bridge"
    id              = 51
    tagged_ports    = []
    untagged_ports  = ["ether8"]
    dhcp            = true
    dhcp_options    = null
  },
  {
    name            = "vlan_90"
    comment         = "guest"
    interface       = "bridge"
    id              = 90
    tagged_ports    = ["ether8"]
    untagged_ports  = []
    dhcp            = true
    dhcp_options    = null
  },
  {
    name            = "vlan_91"
    comment         = "iot"
    interface       = "bridge"
    id              = 91 
    tagged_ports    = ["ether8"]
    untagged_ports  = []
    dhcp            = true
    dhcp_options    = null
  },
  {
    name            = "vlan_100"
    comment         = "internal"
    interface       = "bridge"
    id              = 100
    tagged_ports    = ["ether8", "ether1", "sfp-sfpplus1"]
    untagged_ports  = []
    dhcp            = true
    dhcp_options    = null
  },
  {
    name            = "vlan_150"
    comment         = "public"
    interface       = "bridge"
    id              = 150
    tagged_ports    = ["sfp-sfpplus1"]
    untagged_ports  = []
    dhcp            = false
    dhcp_options    = null
  },
  {
    name            = "vlan_200"
    comment         = "kubernetes"
    interface       = "bridge"
    id              = "200"
    tagged_ports    = ["sfp-sfpplus1"]
    untagged_ports  = ["ether6"]
    dhcp            = true
    dhcp_options    = "ipxe"
  },
  {
    name            = "vlan_201"
    comment         = "kubernetes storage"
    interface       = "bridge"
    id              = "201"
    tagged_ports    = ["sfp-sfpplus1"]
    untagged_ports  = []
    dhcp            = true
    dhcp_options    = null
  }
]

vpn_interface_address = "1"
vpn_interface_subnet = 255

wan = {
  interface = "ether2"
  dhcp      = true
}

wan_allowed = ["vlan_50", "vlan_100", "vlan_150", "vlan_200"]
wifi_country  = "Netherlands"
#wifi_traffic_processing = "on-capsman"
wifi_traffic_processing = "on-cap"

wifi_config-24ghz = [
  {
    name      = "internal-2.4ghz"
    datapath  = "internal_datapath"
    channel   = "Gen 2.4Ghz"
    ssid      = "nauvis"
    security  = "internal"
  },
  {
    name      = "iot-2.4ghz"
    datapath  = "iot_datapath"
    channel   = "test 2.4Ghz"
    ssid      = "nauvis iot"
    security  = "iot"
  }
]

wifi_config-5ghz = [
  {
    name      = "internal-5ghz"
    datapath  = "internal_datapath"
    channel   = "Gen 5Ghz"
    ssid      = "nauvis"
    security  = "internal"
  },
  {
    name      = "iot-5ghz"
    datapath  = "iot_datapath"
    channel   = "Gen 5Ghz"
    ssid      = "nauvis iot"
    security  = "iot"
  }
]

# create configuration using selected datapath, channel, etc
# create provisioning config with all available wifi configs, first list in the entry is master.


wifi_datapath = [
  {
    name                  = "internal_datapath"
    vlan_id               = 100
    client_isolation      = false
    bridge                = "bridge"
  },
  {
    name                  = "guest_datapath"
    vlan_id               = "90"
    client_isolation      = true
    bridge                = "bridge"
  },
  {
    name                  = "iot_datapath"
    vlan_id               = 91
    client_isolation      = false
    bridge                = "bridge"
  }

]
wifi_channel = [
  {
    name                  = "max-perf 5Ghz"
    band                  = "5ghz-ax"
    channel_width         = "20/40/80mhz"
    skip_dfs              = "10min-cac"
    reselect_interval     = "30m..1h"
  },
  {
    name                  = "Gen 5Ghz"
    band                  = "5ghz-ax"
    channel_width         = "20/40mhz"
    skip_dfs              = "10min-cac"
    reselect_interval     = "30m..1h"
  },
  {
    name                  = "Gen 2.4Ghz"
    band                  = "2ghz-ax"
    channel_width         = "20mhz"
    skip_dfs              = "all"
    reselect_interval     = "30m..1h"
  },
  {
    name                  = "test 2.4Ghz"
    band                  = "2ghz-n"
    channel_width         = "20mhz"
    skip_dfs              = "all"
    reselect_interval     = "30m..1h"
  }
]

wifi_security = [
  {
    name                  = "internal"
    authentication_types = ["wpa2-psk"]
    ft                    = false
    ft-over-ds            = false
    management_protection = "allowed"
    # (allowed | disabled | required)
  },
  {
    name                  = "iot"
    authentication_types = ["wpa2-psk"]
    ft                    = false
    ft-over-ds            = false
    management_protection = "allowed"
    # (allowed | disabled | required)
  },
]

