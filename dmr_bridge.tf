resource "solacebroker_msg_vpn_dmr_bridge" "dmrBridges" {
  for_each = {
    for v in var.DmrBridges : "${v.msgVpnName}.${v.remoteNodeName}" => v
  }

  msg_vpn_name = each.value.msgVpnName
  remote_node_name = each.value.remoteNodeName
  remote_msg_vpn_name = each.value.remoteMsgVpnName

  depends_on = [
    solacebroker_msg_vpn.msgVpns,
  ]
}