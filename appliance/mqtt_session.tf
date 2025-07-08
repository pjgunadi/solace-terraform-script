resource "solacebrokerappliance_msg_vpn_mqtt_session" "mqttSessions" {
  for_each = {
      for v in var.MqttSessions : "${v.msgVpnName}.${v.mqttSessionClientId}.${v.mqttSessionVirtualRouter}" => v
  }
  mqtt_session_client_id = each.value.mqttSessionClientId
  mqtt_session_virtual_router = each.value.mqttSessionVirtualRouter
  msg_vpn_name = each.value.msgVpnName
  enabled = each.value.enabled
  owner = each.value.owner
  queue_consumer_ack_propagation_enabled = each.value.queueConsumerAckPropagationEnabled
  queue_dead_msg_queue = each.value.queueDeadMsgQueue
  queue_event_bind_count_threshold = each.value.queueEventBindCountThreshold
  queue_event_msg_spool_usage_threshold = each.value.queueEventMsgSpoolUsageThreshold
  queue_event_reject_low_priority_msg_limit_threshold = each.value.queueEventRejectLowPriorityMsgLimitThreshold
  queue_max_bind_count = each.value.queueMaxBindCount
  queue_max_delivered_unacked_msgs_per_flow = each.value.queueMaxDeliveredUnackedMsgsPerFlow
  queue_max_msg_size = each.value.queueMaxMsgSize
  queue_max_msg_spool_usage = each.value.queueMaxMsgSpoolUsage
  queue_max_redelivery_count = each.value.queueMaxRedeliveryCount
  queue_max_ttl = each.value.queueMaxTtl
  queue_reject_low_priority_msg_enabled = each.value.queueRejectLowPriorityMsgEnabled
  queue_reject_low_priority_msg_limit = each.value.queueRejectLowPriorityMsgLimit
  queue_reject_msg_to_sender_on_discard_behavior = each.value.queueRejectMsgToSenderOnDiscardBehavior
  queue_respect_ttl_enabled = each.value.queueRespectTtlEnabled
  depends_on = [
      solacebrokerappliance_msg_vpn.msgVpns,
  ]
}

resource "solacebrokerappliance_msg_vpn_mqtt_session_subscription" "mqttSessionSubscriptions" {
  for_each = {
    for v in var.MqttSessionSubscriptions : "${v.msgVpnName}.${v.mqttSessionClientId}.${v.mqttSessionVirtualRouter}.${v.subscriptionTopic}" => v
  }
  msg_vpn_name = each.value.msgVpnName
  mqtt_session_client_id = each.value.mqttSessionClientId
  mqtt_session_virtual_router = each.value.mqttSessionVirtualRouter
  subscription_topic = each.value.subscriptionTopic
  subscription_qos = each.value.subscriptionQos
  
  depends_on = [
    solacebrokerappliance_msg_vpn_mqtt_session.mqttSessions,
  ]
}

# Import
import {
  for_each = {
      for v in var.MqttSessions : "${v.msgVpnName}.${v.mqttSessionClientId}.${v.mqttSessionVirtualRouter}" => "${urlencode(v.msgVpnName)}/${urlencode(v.mqttSessionClientId)}/${urlencode(v.mqttSessionVirtualRouter)}" if v._import==true
  }

  to = solacebrokerappliance_msg_vpn_mqtt_session.mqttSessions[each.key]
  id = each.value
}

import {
  for_each = {
    for v in var.MqttSessionSubscriptions : "${v.msgVpnName}.${v.mqttSessionClientId}.${v.mqttSessionVirtualRouter}.${v.subscriptionTopic}" => "${urlencode(v.msgVpnName)}/${urlencode(v.mqttSessionClientId)}/${urlencode(v.mqttSessionVirtualRouter)}/${urlencode(v.subscriptionTopic)}" if v._import==true
  }

  to = solacebrokerappliance_msg_vpn_mqtt_session_subscription.mqttSessionSubscriptions[each.key]
  id = each.value
}
