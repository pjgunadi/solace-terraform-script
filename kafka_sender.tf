resource "solacebroker_msg_vpn_kafka_sender" "kafkaSenders" {
    for_each = {
        for v in var.KafkaSenders : "${v.msgVpnName}.${v.kafkaSenderName}" => v
    }

    msg_vpn_name = each.value.msgVpnName
    kafka_sender_name = each.value.kafkaSenderName
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
    batch_max_msg_count = each.value.batchMaxMsgCount
    batch_max_size = each.value.batchMaxSize
    bootstrap_address_list = each.value.bootstrapAddressList
    enabled = each.value.enabled
    idempotence_enabled = each.value.idempotenceEnabled
    transport_compression_enabled = each.value.transportCompressionEnabled
    transport_compression_level = each.value.transportCompressionLevel
    transport_compression_type = each.value.transportCompressionType
    transport_tls_enabled = each.value.transportTlsEnabled

    depends_on = [ 
        solacebroker_msg_vpn.msgVpns 
    ]
}

resource "solacebroker_msg_vpn_kafka_sender_queue_binding" "kafkaSenderQueueBindings" {
    for_each = {
        for v in var.KafkaSenderQueueBindings : "${v.msgVpnName}.${v.kafkaSenderName}.${v.queueName}" => v
    }

    msg_vpn_name = each.value.msgVpnName
    kafka_sender_name = each.value.kafkaSenderName
    queue_name = each.value.queueName
    ack_mode =  each.value.ackMode
    
    depends_on = [ 
        solacebroker_msg_vpn_kafka_sender.kafkaSenders
    ]
}