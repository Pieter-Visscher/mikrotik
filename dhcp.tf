module "dhcp" {
  source = "git::https://github.com/Pieter-Visscher/terraform-modules.git//routeros-dhcp?ref=main"

  vlans         = var.vlans
  default_cidr  = var.default_cidr
  dhcp_range    = var.dhcp_range
}
