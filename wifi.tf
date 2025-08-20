module "wifi" {
  source = "git::https://github.com/Pieter-Visscher/terraform-modules.git//routeros-wifi?ref=main"

  CAPsMAN             = var.CAPsMAN
  CAPsMAN_interfaces  = var.CAPsMAN_interfaces
  wifi_country        = var.wifi_country
  wifi_passwords      = var.wifi_passwords
  wifi_config         = var.wifi_config
  wifi_datapath       = var.wifi_datapath
  wifi_channel        = var.wifi_channel
  wifi_security       = var.wifi_security
}
