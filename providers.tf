provider "routeros" {
  hosturl  = terraform.workspace == "homelab" ? var.homelab_host_url : terraform.workspace == "test" ? var.test_host_url : ""
  username  = "admin"
  password  = terraform.workspace == "homelab" ? var.homelab_password : terraform.workspace == "test" ? var.test_password : ""
  insecure  = true
}
