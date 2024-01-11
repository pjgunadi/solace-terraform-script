resource "solacebroker_msg_vpn_queue" "queues" {
  for_each = {
    for v in var.Queues : "${v.msgVpnName}.${v.queueName}" => v
  }
    queue_name = each.value.queueName
    msg_vpn_name = each.value.msgVpnName
    access_type = each.value.accessType
    consumer_ack_propagation_enabled = each.value.consumerAckPropagationEnabled
    dead_msg_queue = each.value.deadMsgQueue
    delivery_count_enabled = each.value.deliveryCountEnabled
    delivery_delay = each.value.deliveryDelay
    egress_enabled = each.value.egressEnabled
    ingress_enabled = each.value.ingressEnabled
    max_bind_count = each.value.maxBindCount
    max_delivered_unacked_msgs_per_flow = each.value.maxDeliveredUnackedMsgsPerFlow
    max_msg_size = each.value.maxMsgSize
    max_msg_spool_usage = each.value.maxMsgSpoolUsage
    max_redelivery_count = each.value.maxRedeliveryCount
    max_ttl = each.value.maxTtl
    owner = each.value.owner
    partition_count = each.value.partitionCount
    partition_rebalance_delay = each.value.partitionRebalanceDelay
    partition_rebalance_max_handoff_time = each.value.partitionRebalanceMaxHandoffTime
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
    #Thresholds
    event_bind_count_threshold = each.value.eventBindCountThreshold
    event_msg_spool_usage_threshold = each.value.eventMsgSpoolUsageThreshold
    event_reject_low_priority_msg_limit_threshold = each.value.eventRejectLowPriorityMsgLimitThreshold

  depends_on = [
    solacebroker_msg_vpn.msgVpns
  ]
}

resource "solacebroker_msg_vpn_queue_subscription" "subscriptions" {
  for_each = {
    for v in var.Subscriptions : "${v.msgVpnName}.${v.queueName}.${v.subscriptionTopic}" => v
  }
  subscription_topic = each.value.subscriptionTopic
  queue_name = each.value.queueName
  msg_vpn_name = each.value.msgVpnName

  depends_on = [
    solacebroker_msg_vpn_queue.queues
  ]
}