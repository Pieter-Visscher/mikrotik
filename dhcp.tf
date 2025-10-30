module "dhcp" {
  count = var.enable_dhcp ? 1 : 0
  source = "git::https://github.com/Pieter-Visscher/terraform-modules.git//routeros-dhcp?ref=main"

  vlans             = var.vlans
  default_cidr      = var.default_cidr
  dhcp_range        = var.dhcp_range
  dhcp_options      = var.dhcp_options
  dhcp_option_sets  = var.dhcp_option_sets
}
