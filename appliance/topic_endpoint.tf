resource "solacebroker_msg_vpn_topic_endpoint" "topicEndpoints" {
    for_each = {
        for v in var.TopicEndpoints : "${v.msgVpnName}.${v.topicEndpointName}" => v
    }

    msg_vpn_name = each.value.msgVpnName
    topic_endpoint_name = each.value.topicEndpointName
    access_type = each.value.accessType
    consumer_ack_propagation_enabled = each.value.consumerAckPropagationEnabled
    dead_msg_queue = each.value.deadMsgQueue
    delivery_count_enabled = each.value.deliveryCountEnabled
    delivery_delay = each.value.deliveryDelay
    egress_enabled = each.value.egressEnabled
    event_bind_count_threshold = each.value.eventBindCountThreshold
    event_reject_low_priority_msg_limit_threshold = each.value.eventRejectLowPriorityMsgLimitThreshold
    event_spool_usage_threshold = each.value.eventSpoolUsageThreshold
    ingress_enabled = each.value.ingressEnabled
    max_bind_count = each.value.maxBindCount
    max_delivered_unacked_msgs_per_flow = each.value.maxDeliveredUnackedMsgsPerFlow
    max_msg_size = each.value.maxMsgSize
    max_redelivery_count = each.value.maxRedeliveryCount
    max_spool_usage = each.value.maxSpoolUsage
    max_ttl = each.value.maxTtl
    owner = each.value.owner
    permission = each.value.permission
    redelivery_delay_enabled = each.value.redeliveryDelayEnabled
    redelivery_delay_initial_interval = each.value.redeliveryDelayInitialInterval
    redelivery_delay_max_interval = each.value.redeliveryDelayMaxInterval
    redelivery_delay_multiplier = each.value.redeliveryDelayMultiplier
    redelivery_enabled = each.value.redeliveryEnabled
    reject_low_priority_msg_enabled = each.value.rejectLowPriorityMsgEnabled
    reject_low_priority_msg_limit = each.value.rejectLowPriorityMsgLimit
    reject_msg_to_sender_on_discard_behavior = each.value.rejectMsgToSenderOnDiscardBehavior
    respect_msg_priority_enabled = each.value.respectMsgPriorityEnabled
    respect_ttl_enabled = each.value.respectTtlEnabled

    depends_on = [
        solacebroker_msg_vpn.msgVpns
    ]
}

# Import
import {
  for_each = {
    for v in var.TopicEndpoints : "${v.msgVpnName}.${v.topicEndpointName}" => "${urlencode(v.msgVpnName)}/${urlencode(v.topicEndpointName)}" if v._import==true
  }

  to = solacebroker_msg_vpn_topic_endpoint.topicEndpoints[each.key]
  id = each.value
}
