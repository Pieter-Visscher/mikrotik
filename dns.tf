module "dns" {
  source = "git::https://github.com/Pieter-Visscher/terraform-modules.git//routeros-dns?ref=main"
  dns_records = var.dns_records
}
