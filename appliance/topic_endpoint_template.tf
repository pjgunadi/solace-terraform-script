resource "solacebroker_msg_vpn_topic_endpoint_template" "topicEndpointTemplates" {
    for_each = {
        for v in var.TopicEndpointTemplates : "${v.msgVpnName}.${v.topicEndpointTemplateName}" => v
    }
    msg_vpn_name = each.value.msgVpnName
    topic_endpoint_template_name = each.value.topicEndpointTemplateName
    access_type = each.value.accessType
    consumer_ack_propagation_enabled = each.value.consumerAckPropagationEnabled
    dead_msg_queue = each.value.deadMsgQueue
    delivery_delay = each.value.deliveryDelay
    event_bind_count_threshold = each.value.eventBindCountThreshold
    event_msg_spool_usage_threshold = each.value.eventMsgSpoolUsageThreshold
    event_reject_low_priority_msg_limit_threshold = each.value.eventRejectLowPriorityMsgLimitThreshold
    max_bind_count = each.value.maxBindCount
    max_delivered_unacked_msgs_per_flow = each.value.maxDeliveredUnackedMsgsPerFlow
    max_msg_size = each.value.maxMsgSize
    max_msg_spool_usage = each.value.maxMsgSpoolUsage
    max_redelivery_count = each.value.maxRedeliveryCount
    max_ttl = each.value.maxTtl
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
    topic_endpoint_name_filter = each.value.topicEndpointNameFilter
    
    depends_on = [
        solacebroker_msg_vpn.msgVpns
    ]
}

# Import
import {
    for_each = {
        for v in var.TopicEndpointTemplates : "${v.msgVpnName}.${v.topicEndpointTemplateName}" => "${urlencode(v.msgVpnName)}/${urlencode(v.topicEndpointTemplateName)}" if v._import==true
    }

    to = solacebroker_msg_vpn_topic_endpoint_template.topicEndpointTemplates[each.key]
    id = each.value
}