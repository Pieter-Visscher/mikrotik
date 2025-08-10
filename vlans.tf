module "vlans" {
  source = "git::https://github.com/Pieter-Visscher/terraform-modules.git//routeros-vlans?ref=main"

  vlans = var.vlans
  default_cidr  = var.default_cidr
  bridge = var.bridge
}
