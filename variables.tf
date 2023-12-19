variable "name" {}

variable "description" {
  default = null
}

variable "rules" {
  type = map(object({
    direction        = optional(string, "ingress")
    ethertype        = optional(string, "IPv4")
    protocol         = optional(string, "tcp")
    port_range_min   = string
    port_range_max   = optional(string)
    remote_ip_prefix = string
  }))
  default = {}
}