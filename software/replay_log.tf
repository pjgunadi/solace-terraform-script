resource "solacebroker_msg_vpn_replay_log" "replayLogs" {
  for_each = {
    for v in var.ReplayLogs : "${v.msgVpnName}.${v.replayLogName}" => v
  }
  
  msg_vpn_name = each.value.msgVpnName
  replay_log_name = each.value.replayLogName
  egress_enabled = each.value.egressEnabled
  ingress_enabled = each.value.ingressEnabled
  max_spool_usage = each.value.maxSpoolUsage
  topic_filter_enabled = each.value.topicFilterEnabled

  depends_on = [
    solacebroker_msg_vpn.msgVpns
  ]
}

resource "solacebroker_msg_vpn_replay_log_topic_filter_subscription" "replayLogTopicFilterSubscriptions" {
  for_each = {
    for v in var.ReplayLogTopicFilterSubscriptions : "${v.msgVpnName}.${v.replayLogName}.${v.topicFilterSubscription}" => v
  }
  
  msg_vpn_name = each.value.msgVpnName
  replay_log_name = each.value.replayLogName
  topic_filter_subscription = each.value.topicFilterSubscription

  depends_on = [
    solacebroker_msg_vpn_replay_log.replayLogs
  ]
}

# Import
import {
  for_each = {
    for v in var.ReplayLogs : "${v.msgVpnName}.${v.replayLogName}" => "${urlencode(v.msgVpnName)}/${urlencode(v.replayLogName)}" if v._import==true
  }

  to = solacebroker_msg_vpn_replay_log.replayLogs[each.key]
  id = each.value
}

import {
  for_each = {
    for v in var.ReplayLogTopicFilterSubscriptions : "${v.msgVpnName}.${v.replayLogName}.${v.topicFilterSubscription}" => "${urlencode(v.msgVpnName)}/${urlencode(v.replayLogName)}/${urlencode(v.topicFilterSubscription)}" if v._import==true
  }

  to = solacebroker_msg_vpn_replay_log_topic_filter_subscription.replayLogTopicFilterSubscriptions[each.key]
  id = each.value
}