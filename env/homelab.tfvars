default_cidr = "10.0.0.0/24"

wan = {
  interface = "ether2"
  dhcp      = true
}

bridges = [
  {
    name            = "bridge"
    pvid            = 1
  }
]
vlans = [
  # commented out for dev purposes as the current situation does not follow the standard (ip 10.0.50.3 instead of 10.0.50.1, side by side with prod network in same subnet)
  {
    name            = "vlan_50"
    comment         = "management"
    interface       = "bridge"
    id              = 50
    tagged_ports    = []
    untagged_ports  = []
  },
  #{
  #  name            = "vlan_90"
  #  comment         = "guest"
  #  interface       = "bridge2"
  #  id              = 90
  #  tagged_ports    = ["ether8"]
  #  untagged_ports  = []
  #},
  {
    name            = "vlan_91"
    comment         = "iot"
    interface       = "bridge"
    id              = 91 
    tagged_ports    = ["ether8"]
    untagged_ports  = []
  },
  {
    name            = "vlan_100"
    comment         = "internal"
    interface       = "bridge"
    id              = 100
    tagged_ports    = ["ether8"]
    untagged_ports  = []
  },
  {
    name            = "vlan_150"
    comment         = "public"
    interface       = "bridge"
    id              = 150
    tagged_ports    = []
    untagged_ports  = []
  },
  {
    name            = "vlan_200"
    comment         = "kubernetes"
    interface       = "bridge"
    id              = "200"
    tagged_ports    = []
    untagged_ports  = []
  }
]


CAPsMAN       = true
CAPsMAN_interfaces = ["ether8"]

wifi_country  = "Netherlands"

wifi_config = [
  {
    name      = "internal"
    datapath  = "internal_datapath"
    channel   = "max-perf 5Ghz"
    security  = "WPA2/3 PSK - no roaming"
    ssid      = "nauvis"
  },
  {
    name      = "iot"
    datapath  = "iot_datapath"
    channel   = "Gen 5Ghz"
    security  = "WPA2/3 PSK - iot"
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
    channel_width         = "20/40/80/160mhz"
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
    name                  = "WPA2/3 PSK - no roaming"
    authentication_types = ["wpa2-psk", "wpa3-psk"]
    ft                    = false
    ft-over-ds            = false
    management_protection = "required"
    # (allowed | disabled | required)
  },
  {
    name                  = "WPA2/3 PSK - iot"
    authentication_types = ["wpa2-psk", "wpa3-psk"]
    ft                    = false
    ft-over-ds            = false
    management_protection = "disabled"
    # (allowed | disabled | required)
  },
]

