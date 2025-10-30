module "firewall" {
  count = var.enable_firewall ? 1 : 0
  source = "git::https://github.com/Pieter-Visscher/terraform-modules.git//routeros-firewall?ref=main"

  wan_allowed = var.wan_allowed
}
