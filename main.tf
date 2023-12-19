resource "openstack_networking_secgroup_v2" "this" {
  name        = var.name
  description = var.description
}

resource "openstack_networking_secgroup_rule_v2" "this" {
  for_each          = var.rules
  security_group_id = openstack_networking_secgroup_v2.this.id
  direction         = each.value.direction
  ethertype         = each.value.ethertype
  protocol          = each.value.protocol
  port_range_min    = each.value.port_range_min
  port_range_max    = coalesce(each.value.port_range_max, each.value.port_range_min)
  remote_ip_prefix  = each.value.remote_ip_prefix
}