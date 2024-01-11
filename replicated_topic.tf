resource "solacebroker_msg_vpn_replicated_topic" "replicatedTopics" {
  for_each = {
    for v in var.ReplicatedTopics : "${v.msgVpnName}.${v.replicatedTopic}" => v
  }
  
  msg_vpn_name = each.value.msgVpnName
  replicated_topic = each.value.replicatedTopic
  replication_mode = each.value.replicationMode

  depends_on = [
    solacebroker_msg_vpn.msgVpns
  ]
}