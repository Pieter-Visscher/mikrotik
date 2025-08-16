default_cidr = "10.0.0.0/24"

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

wan = {
  interface = "ether2"
  dhcp      = true
}
