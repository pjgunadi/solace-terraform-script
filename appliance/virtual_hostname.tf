resource "solacebrokerappliance_virtual_hostname" "virtualHostnames" {
  for_each = {
    for v in var.VirtualHostnames : "${v.virtualHostname}" => v
  }
  virtual_hostname = each.value.virtualHostname
  enabled = each.value.enabled
  msg_vpn_name = each.value.msgVpnName
}

# Import
import {
  for_each = {
    for v in var.VirtualHostnames : "${v.virtualHostname}" => "${urlencode(v.virtualHostname)}" if v._import==true
  }

  to = solacebrokerappliance_virtual_hostname.virtualHostnames[each.key]
  id = each.value
}