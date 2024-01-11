variable "JndiConnectionFactories" {
    type = list(object({
        msgVpnName = string
        connectionFactoryName = string
        allowDuplicateClientIdEnabled = optional(bool)
        clientDescription = optional(string)
        clientId = optional(string)
        dtoReceiveOverrideEnabled = optional(bool)
        dtoReceiveSubscriberLocalPriority = optional(number)
        dtoReceiveSubscriberNetworkPriority = optional(number)
        dtoSendEnabled = optional(bool)
        dynamicEndpointCreateDurableEnabled = optional(bool)
        dynamicEndpointRespectTtlEnabled = optional(bool)
        guaranteedReceiveAckTimeout = optional(number)
        guaranteedReceiveReconnectRetryCount = optional(number)
        guaranteedReceiveReconnectRetryWait = optional(number)
        guaranteedReceiveWindowSize = optional(number)
        guaranteedReceiveWindowSizeAckThreshold = optional(number)
        guaranteedSendAckTimeout = optional(number)
        guaranteedSendWindowSize = optional(number)
        messagingDefaultDeliveryMode = optional(string)
        messagingDefaultDmqEligibleEnabled = optional(bool)
        messagingDefaultElidingEligibleEnabled = optional(bool)
        messagingJmsxUserIdEnabled = optional(bool)
        messagingTextInXmlPayloadEnabled = optional(bool)
        transportCompressionLevel = optional(number)
        transportConnectRetryCount = optional(number)
        transportConnectRetryPerHostCount = optional(number)
        transportConnectTimeout = optional(number)
        transportDirectTransportEnabled = optional(bool)
        transportKeepaliveCount = optional(number)
        transportKeepaliveEnabled = optional(bool)
        transportKeepaliveInterval = optional(number)
        transportMsgCallbackOnIoThreadEnabled = optional(bool)
        transportOptimizeDirectEnabled = optional(bool)
        transportPort = optional(number)
        transportReadTimeout = optional(number)
        transportReceiveBufferSize = optional(number)
        transportReconnectRetryCount = optional(number)
        transportReconnectRetryWait = optional(number)
        transportSendBufferSize = optional(number)
        transportTcpNoDelayEnabled = optional(bool)
        xaEnabled = optional(bool)
    }))
    default = []
}

variable "JndiQueues" {
    type = list(object({
        msgVpnName = string
        queueName = string
        physicalName = optional(string)
    }))
    default = []
}

variable "JndiTopics" {
    type = list(object({
        msgVpnName = string
        topicName = string
        physicalName = optional(string)
    }))
    default = []
}