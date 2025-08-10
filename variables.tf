variable "bridge" {
  type      = string
  default   = "bridge1"
}
variable "homelab_password" {
  type      = string
  sensitive = true
}

variable "homelab_host_url" {
  type      = string
}

variable "test_password" {
  type      = string
  sensitive = true
}

variable "test_host_url" {
  type      = string
}

variable "vlans" {
  description = "List of vlans present on your Mikrotik device"
  type = list(object({
    name           = string
    id             = number
    tagged_ports   = list(string)
    untagged_ports = list(string)
  }))
  default = []
}
variable "default_cidr" {
  description = "Default cidr used as base for all subnets"
  type        = string
}

