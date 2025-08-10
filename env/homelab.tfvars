default_cidr = "10.0.0.0/24"
bridge       = "primary-bridge"

vlans = [
  {
    name            = "test_terraform"
    id              = 1234
    tagged_ports    = []
    untagged_ports  = []
  },
  {
    name            = "test_terraform2"
    id              = 1235
    tagged_ports    = []
    untagged_ports  = []
  },
]
