resource "openstack_networking_secgroup_v2" "this" {
  name        = var.name
  description = var.description
}

resource "openstack_networking_secgroup_rule_v2" "this" {
  for_each          = var.rules
  direction         = try(each.value["direction"], "ingress")
  ethertype         = try(each.value["ethertype"], "IPv4")
  protocol          = try(each.value["protocol"], "tcp")
  port_range_min    = each.value["port_range_min"]
  port_range_max    = try(each.value["port_range_max"], each.value["port_range_min"])
  remote_ip_prefix  = each.value["remote_ip_prefix"]
  security_group_id = openstack_networking_secgroup_v2.this.id
}