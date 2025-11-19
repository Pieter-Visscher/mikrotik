bridges = [
  {
    name            = "bridge"
    pvid            = 1
  }
]

bonds = [
  {
    name            = "bond0"
    comment         = "talos-controlplane"
    slaves          = ["ether1", "ether2"]
    lacp_rate       = "1sec"
    mode            = "802.3ad"
  },
  {
    name            = "bond1"
    comment         = "talos-controlplane"
    slaves          = ["ether3", "ether4"]
    lacp_rate       = "1sec"
    mode            = "802.3ad"
  },
  {
    name            = "bond2"
    comment         = "talos-controlplane"
    slaves          = ["ether5", "ether6"]
    lacp_rate       = "1sec"
    mode            = "802.3ad"
  }
]

default_cidr = "10.0.0.0/24"
enable_dhcp = false
enable_firewall = false
enable_wifi = false
enable_wireguard = false

vlan_address_creation = false

vlans = [
  {
    name            = "vlan_50"
    comment         = "management"
    interface       = "bridge"
    id              = 50
    tagged_ports    = ["sfp-sfpplus1"]
    untagged_ports  = ["bond0", "bond1", "bond2"]
    dhcp            = false
    dhcp_options    = null
  },
  {
    name            = "vlan_51"
    comment         = "ap-management"
    interface       = "bridge"
    id              = 51
    tagged_ports    = []
    untagged_ports  = []
    dhcp            = false
    dhcp_options    = null
  },
  {
    name            = "vlan_90"
    comment         = "guest"
    interface       = "bridge"
    id              = 90
    tagged_ports    = []
    untagged_ports  = []
    dhcp            = false
    dhcp_options    = null
  },
  {
    name            = "vlan_91"
    comment         = "iot"
    interface       = "bridge"
    id              = 91 
    tagged_ports    = []
    untagged_ports  = []
    dhcp            = false
    dhcp_options    = null
  },
  {
    name            = "vlan_100"
    comment         = "internal"
    interface       = "bridge"
    id              = 100
    tagged_ports    = ["sfp-sfpplus1"]
    untagged_ports  = []
    dhcp            = false 
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
    tagged_ports    = ["sfp-sfpplus1", "bond0", "bond1", "bond2"]
    untagged_ports  = []
    dhcp            = false
    dhcp_options    = null 
  }
]
