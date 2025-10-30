provider "routeros" {
  hosturl  = terraform.workspace == "homelab" ? var.homelab_host_url : terraform.workspace == "switch1" ? var.switch1_host_url: ""
  username  = "admin"
  password  = terraform.workspace == "homelab" ? var.homelab_password : terraform.workspace == "switch1" ? var.switch1_password : ""
  insecure  = true
}
