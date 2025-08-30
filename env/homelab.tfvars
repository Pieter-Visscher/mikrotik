bridges = [
  {
    name            = "bridge"
    pvid            = 1
  }
]

CAPsMAN            = true
CAPsMAN_interfaces = ["vlan_51"]

default_cidr = "10.0.0.0/24"
dhcp_range   = [200, 254]

vlans = [
  {
    name            = "vlan_50"
    comment         = "management"
    interface       = "bridge"
    id              = 50
    tagged_ports    = []
    untagged_ports  = []
    dhcp            = false
  },
  {
    name            = "vlan_51"
    comment         = "ap-management"
    interface       = "bridge"
    id              = 51
    tagged_ports    = []
    untagged_ports  = ["ether8"]
    dhcp            = true
  },
  #{
  #  name            = "vlan_90"
  #  comment         = "guest"
  #  interface       = "bridge2"
  #  id              = 90
  #  tagged_ports    = ["ether8"]
  #  untagged_ports  = []
  #  dhcp            = true
  #},
  {
    name            = "vlan_91"
    comment         = "iot"
    interface       = "bridge"
    id              = 91 
    tagged_ports    = ["ether8"]
    untagged_ports  = []
    dhcp            = true
  },
  {
    name            = "vlan_100"
    comment         = "internal"
    interface       = "bridge"
    id              = 100
    tagged_ports    = ["ether8"]
    untagged_ports  = []
    dhcp            = true
  },
  {
    name            = "vlan_150"
    comment         = "public"
    interface       = "bridge"
    id              = 150
    tagged_ports    = []
    untagged_ports  = []
    dhcp            = false
  },
  {
    name            = "vlan_200"
    comment         = "kubernetes"
    interface       = "bridge"
    id              = "200"
    tagged_ports    = []
    untagged_ports  = []
    dhcp            = false
  }
]


wan = {
  interface = "ether2"
  dhcp      = true
}

wan_allowed = ["vlan_50", "vlan_100", "vlan_150", "vlan_200"]
wifi_country  = "Netherlands"

wifi_config = [
  {
    name      = "internal"
    datapath  = "internal_datapath"
    channel   = "max-perf 5Ghz"
    ssid      = "nauvis"
  },
  {
    name      = "iot"
    datapath  = "iot_datapath"
    channel   = "Gen 5Ghz"
    ssid      = "nauvis iot"
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
  #{
  #  name                  = "guest_datapath"
  #  vlan_id               = "guest"
  #  client_isolation      = true
  #  bridge                = "bridge"
  #},
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
    skip_dfs              = "all"
    reselect_interval     = "30m..1h"
    frequency             = [5160, 5200, 5240, 5745, 5765, 5785, 5805, 5825]
  },
  {
    name                  = "Gen 5Ghz"
    band                  = "5ghz-ax"
    channel_width         = "20/40mhz"
    skip_dfs              = "all"
    reselect_interval     = "30m..1h"
    frequency             = [5160, 5200, 5240, 5745, 5765, 5785, 5805, 5825]
  }
]

wifi_security = [
  {
    name                  = "internal"
    authentication_types = ["wpa2-psk", "wpa3-psk"]
    ft                    = false
    ft-over-ds            = false
    management_protection = "required"
    # (allowed | disabled | required)
  },
  {
    name                  = "iot"
    authentication_types = ["wpa2-psk", "wpa3-psk"]
    ft                    = false
    ft-over-ds            = false
    management_protection = "allowed"
    # (allowed | disabled | required)
  },
]

