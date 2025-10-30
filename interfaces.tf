module "vlans" {
  source = "git::https://github.com/Pieter-Visscher/terraform-modules.git//routeros-interfaces?ref=main"

  bridges               = var.bridges
  default_cidr          = var.default_cidr
  edge                  = var.edge
  vlans                 = var.vlans
  vlan_address_creation = var.vlan_address_creation
  wan                   = var.wan
}
