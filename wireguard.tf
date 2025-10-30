module "wireguard" {
  source = "git::https://github.com/Pieter-Visscher/terraform-modules.git//routeros-wireguard?ref=main"
  count = var.enable_wireguard ? 1 : 0

  default_cidr          = var.default_cidr
  vpn_interface_subnet  = var.vpn_interface_subnet
  vpn_interface_address = var.vpn_interface_address
  vpn_peers             = var.vpn_peers
  wan_ip                = var.wan_ip
}


