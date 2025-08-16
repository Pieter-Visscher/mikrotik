module "vlans" {
  source = "git::https://github.com/Pieter-Visscher/terraform-modules.git//routeros-interfaces?ref=main"

  vlans         = var.vlans
  default_cidr  = var.default_cidr
  bridges       = var.bridges

  wan          = var.wan
}
