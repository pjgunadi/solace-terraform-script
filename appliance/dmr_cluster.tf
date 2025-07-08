resource "solacebrokerappliance_dmr_cluster" "dmrClusters" {
    for_each = {
        for v in var.DmrClusters : "${v.dmrClusterName}" => v
    }

    dmr_cluster_name = each.value.dmrClusterName
    authentication_basic_enabled = each.value.authenticationBasicEnabled
    authentication_basic_password = each.value.authenticationBasicPassword
    authentication_basic_type = each.value.authenticationBasicType
    authentication_client_cert_content = each.value.authenticationClientCertContent
    authentication_client_cert_enabled = each.value.authenticationClientCertEnabled
    authentication_client_cert_password = each.value.authenticationClientCertPassword
    direct_only_enabled = each.value.directOnlyEnabled
    enabled = each.value.enabled
    tls_server_cert_max_chain_depth = each.value.tlsServerCertMaxChainDepth
    tls_server_cert_validate_date_enabled = each.value.tlsServerCertValidateDateEnabled
    tls_server_cert_validate_name_enabled = each.value.tlsServerCertValidateNameEnabled

}

resource "solacebrokerappliance_dmr_cluster_cert_matching_rule" "dmrClusterCertMatchingRules" {
    for_each = {
        for v in var.DmrClusterCertMatchingRules : "${v.dmrClusterName}.${v.ruleName}" => v
    }

    dmr_cluster_name = each.value.dmrClusterName
    rule_name = each.value.ruleName
    enabled = each.value.enabled

    depends_on = [
        solacebrokerappliance_dmr_cluster.dmrClusters
    ]
}

resource "solacebrokerappliance_dmr_cluster_cert_matching_rule_attribute_filter" "dmrClusterCertMatchingRuleAttributeFilters" {
    for_each = {
        for v in var.DmrClusterCertMatchingRuleAttributeFilters : "${v.dmrClusterName}.${v.ruleName}.${v.filterName}" => v
    }

    dmr_cluster_name = each.value.dmrClusterName
    rule_name = each.value.ruleName
    filter_name = each.value.filterName
    attribute_name = each.value.attributeName
    attribute_value = each.value.attributeValue

    depends_on = [
        solacebrokerappliance_dmr_cluster.dmrClusters,
        solacebrokerappliance_dmr_cluster_cert_matching_rule.dmrClusterCertMatchingRules
    ]
}

resource "solacebrokerappliance_dmr_cluster_cert_matching_rule_condition" "dmrClusterCertMatchingRuleConditions" {
    for_each = {
        for v in var.DmrClusterCertMatchingRuleConditions : "${v.dmrClusterName}.${v.ruleName}.${v.source}" => v
    }

    dmr_cluster_name = each.value.dmrClusterName
    rule_name = each.value.ruleName
    source = each.value.source
    attribute = each.value.attribute
    expression = each.value.expression

    depends_on = [
        solacebrokerappliance_dmr_cluster.dmrClusters,
        solacebrokerappliance_dmr_cluster_cert_matching_rule.dmrClusterCertMatchingRules
    ]
}

resource "solacebrokerappliance_dmr_cluster_link" "dmrClusterLinks" {
    for_each = {
        for v in var.DmrClusterLinks : "${v.dmrClusterName}.${v.remoteNodeName}" => v
    }

    dmr_cluster_name = each.value.dmrClusterName
    remote_node_name = each.value.remoteNodeName
    authentication_basic_password = each.value.authenticationBasicPassword
    authentication_scheme = each.value.authenticationScheme
    client_profile_queue_control1_max_depth = each.value.clientProfileQueueControl1MaxDepth
    client_profile_queue_control1_min_msg_burst = each.value.clientProfileQueueControl1MinMsgBurst
    client_profile_queue_direct1_max_depth = each.value.clientProfileQueueDirect1MaxDepth
    client_profile_queue_direct1_min_msg_burst = each.value.clientProfileQueueDirect1MinMsgBurst
    client_profile_queue_direct2_max_depth = each.value.clientProfileQueueDirect2MaxDepth
    client_profile_queue_direct2_min_msg_burst = each.value.clientProfileQueueDirect2MinMsgBurst
    client_profile_queue_direct3_max_depth = each.value.clientProfileQueueDirect3MaxDepth
    client_profile_queue_direct3_min_msg_burst = each.value.clientProfileQueueDirect3MinMsgBurst
    client_profile_queue_guaranteed1_max_depth = each.value.clientProfileQueueGuaranteed1MaxDepth
    client_profile_queue_guaranteed1_min_msg_burst = each.value.clientProfileQueueGuaranteed1MinMsgBurst
    client_profile_tcp_congestion_window_size = each.value.clientProfileTcpCongestionWindowSize
    client_profile_tcp_keepalive_count = each.value.clientProfileTcpKeepaliveCount
    client_profile_tcp_keepalive_idle_time = each.value.clientProfileTcpKeepaliveIdleTime
    client_profile_tcp_keepalive_interval = each.value.clientProfileTcpKeepaliveInterval
    client_profile_tcp_max_segment_size = each.value.clientProfileTcpMaxSegmentSize
    client_profile_tcp_max_window_size = each.value.clientProfileTcpMaxWindowSize
    egress_flow_window_size = each.value.egressFlowWindowSize
    enabled = each.value.enabled
    initiator = each.value.initiator
    queue_dead_msg_queue = each.value.queueDeadMsgQueue
    queue_event_spool_usage_threshold = each.value.queueEventSpoolUsageThreshold
    queue_max_delivered_unacked_msgs_per_flow = each.value.queueMaxDeliveredUnackedMsgsPerFlow
    queue_max_msg_spool_usage = each.value.queueMaxMsgSpoolUsage
    queue_max_redelivery_count = each.value.queueMaxRedeliveryCount
    queue_max_ttl = each.value.queueMaxTtl
    queue_reject_msg_to_sender_on_discard_behavior = each.value.queueRejectMsgToSenderOnDiscardBehavior
    queue_respect_ttl_enabled = each.value.queueRespectTtlEnabled
    span = each.value.span
    transport_compressed_enabled = each.value.transportCompressedEnabled
    transport_tls_enabled = each.value.transportTlsEnabled

    depends_on = [
        solacebrokerappliance_dmr_cluster.dmrClusters
    ]
}

resource "solacebrokerappliance_dmr_cluster_link_attribute" "dmrClusterLinkAttributes" {
    for_each = {
        for v in var.DmrClusterLinkAttributes : "${v.dmrClusterName}.${v.remoteNodeName}.${v.attributeName}.${v.attributeValue}" => v
    }

    dmr_cluster_name = each.value.dmrClusterName
    remote_node_name = each.value.remoteNodeName
    attribute_name = each.value.attributeName
    attribute_value = each.value.attributeValue

    depends_on = [
        solacebrokerappliance_dmr_cluster_link.dmrClusterLinks
    ]
}

resource "solacebrokerappliance_dmr_cluster_link_remote_address" "dmrClusterLinkRemoteAddresses" {
    for_each = {
        for v in var.DmrClusterLinkRemoteAddresses : "${v.dmrClusterName}.${v.remoteNodeName}.${v.remoteAddress}" => v
    }
    dmr_cluster_name = each.value.dmrClusterName
    remote_node_name = each.value.remoteNodeName
    remote_address = each.value.remoteAddress
    
    depends_on = [
        solacebrokerappliance_dmr_cluster_link.dmrClusterLinks
    ]
}

# Import
import {
    for_each = {
        for v in var.DmrClusters : "${v.dmrClusterName}" => "${urlencode(v.dmrClusterName)}" if v._import==true
    }

    to = solacebrokerappliance_dmr_cluster.dmrClusters[each.key]
    id = each.value
}

import {
    for_each = {
        for v in var.DmrClusterCertMatchingRules : "${v.dmrClusterName}.${v.ruleName}" => "${urlencode(v.dmrClusterName)}/${urlencode(v.ruleName)}" if v._import==true
    }

    to = solacebrokerappliance_dmr_cluster_cert_matching_rule.dmrClusterCertMatchingRules[each.key]
    id = each.value
}

import {
    for_each = {
        for v in var.DmrClusterCertMatchingRuleAttributeFilters : "${v.dmrClusterName}.${v.ruleName}.${v.filterName}" => "${urlencode(v.dmrClusterName)}/${urlencode(v.ruleName)}/${urlencode(v.filterName)}" if v._import==true
    }

    to = solacebrokerappliance_dmr_cluster_cert_matching_rule_attribute_filter.dmrClusterCertMatchingRuleAttributeFilters[each.key]
    id = each.value
}

import {
    for_each = {
        for v in var.DmrClusterCertMatchingRuleConditions : "${v.dmrClusterName}.${v.ruleName}.${v.source}" => "${urlencode(v.dmrClusterName)}/${urlencode(v.ruleName)}/${urlencode(v.source)}" if v._import==true
    }

    to = solacebrokerappliance_dmr_cluster_cert_matching_rule_condition.dmrClusterCertMatchingRuleConditions[each.key]
    id = each.value
}

import {
    for_each = {
        for v in var.DmrClusterLinks : "${v.dmrClusterName}.${v.remoteNodeName}" => "${urlencode(v.dmrClusterName)}/${urlencode(v.remoteNodeName)}" if v._import==true
    }

    to = solacebrokerappliance_dmr_cluster_link.dmrClusterLinks[each.key]
    id = each.value
}

import {
    for_each = {
        for v in var.DmrClusterLinkAttributes : "${v.dmrClusterName}.${v.remoteNodeName}.${v.attributeName}.${v.attributeValue}" => "${urlencode(v.dmrClusterName)}/${urlencode(v.remoteNodeName)}/${urlencode(v.attributeName)}/${urlencode(v.attributeValue)}" if v._import==true
    }

    to = solacebrokerappliance_dmr_cluster_link_attribute.dmrClusterLinkAttributes[each.key]
    id = each.value
}
    
import {
    for_each = {
        for v in var.DmrClusterLinkRemoteAddresses : "${v.dmrClusterName}.${v.remoteNodeName}.${v.remoteAddress}" => "${urlencode(v.dmrClusterName)}/${urlencode(v.remoteNodeName)}/${urlencode(v.remoteAddress)}" if v._import==true
    }

    to = solacebrokerappliance_dmr_cluster_link_remote_address.dmrClusterLinkRemoteAddresses[each.key]
    id = each.value
}
