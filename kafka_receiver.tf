resource "solacebroker_msg_vpn_kafka_receiver" "kafkaReceivers" {
    for_each = {
        for v in var.KafkaReceivers : "${v.msgVpnName}.${v.kafkaReceiverName}" => v
    }

    msg_vpn_name = each.value.msgVpnName
    kafka_receiver_name = each.value.kafkaReceiverName
    authentication_basic_password = each.value.authenticationBasicPassword
    authentication_basic_username = each.value.authenticationBasicUsername
    authentication_client_cert_content = each.value.authenticationClientCertContent
    authentication_client_cert_password = each.value.authenticationClientCertPassword
    authentication_oauth_client_id = each.value.authenticationOauthClientId
    authentication_oauth_client_scope = each.value.authenticationOauthClientScope
    authentication_oauth_client_secret = each.value.authenticationOauthClientSecret
    authentication_oauth_client_token_endpoint = each.value.authenticationOauthClientTokenEndpoint
    authentication_scheme = each.value.authenticationScheme
    authentication_scram_hash = each.value.authenticationScramHash
    authentication_scram_password = each.value.authenticationScramPassword
    authentication_scram_username = each.value.authenticationScramUsername
    batch_delay = each.value.batchDelay
    batch_max_size = each.value.batchMaxSize
    bootstrap_address_list = each.value.bootstrapAddressList
    enabled = each.value.enabled
    group_id = each.value.groupId
    group_keepalive_interval = each.value.groupKeepaliveInterval
    group_keepalive_timeout = each.value.groupKeepaliveTimeout
    group_membership_type = each.value.groupMembershipType
    group_partition_scheme_list = each.value.groupPartitionSchemeList
    metadata_topic_exclude_list = each.value.metadataTopicExcludeList
    metadata_topic_refresh_interval = each.value.metadataTopicRefreshInterval
    transport_tls_enabled = each.value.transportTlsEnabled

    depends_on = [ 
        solacebroker_msg_vpn.msgVpns 
    ]
}

resource "solacebroker_msg_vpn_kafka_receiver_topic_binding" "kafkaReceiverTopicBindings" {
    for_each = {
        for v in var.KafkaReceiverTopicBindings : "${v.msgVpnName}.${v.kafkaReceiverName}.${v.topicName}" => v
    }

    msg_vpn_name = each.value.msgVpnName
    kafka_receiver_name = each.value.kafkaReceiverName
    topic_name = each.value.topicName
    enabled = each.value.enabled
    initial_offset = each.value.initialOffset
    local_key = each.value.localKey
    local_topic = each.value.localTopic
    
    depends_on = [ 
        solacebroker_msg_vpn_kafka_receiver.kafkaReceivers
    ]
}