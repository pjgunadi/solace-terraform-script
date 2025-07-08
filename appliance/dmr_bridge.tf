resource "solacebrokerappliance_msg_vpn_dmr_bridge" "dmrBridges" {
  for_each = {
    for v in var.DmrBridges : "${v.msgVpnName}.${v.remoteNodeName}" => v
  }

  msg_vpn_name = each.value.msgVpnName
  remote_node_name = each.value.remoteNodeName
  remote_msg_vpn_name = each.value.remoteMsgVpnName

  depends_on = [
    solacebrokerappliance_msg_vpn.msgVpns,
  ]
}

# Import
import {
  for_each = {
    for v in var.DmrBridges : "${v.msgVpnName}.${v.remoteNodeName}" => "${urlencode(v.msgVpnName)}/${urlencode(v.remoteNodeName)}" if v._import==true
  }

  to = solacebrokerappliance_msg_vpn_dmr_bridge.dmrBridges[each.key]
  id = each.value
}
