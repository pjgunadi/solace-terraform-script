variable "ClientProfiles" {
    type = list(object({
        clientProfileName = string
        msgVpnName = string
        allowBridgeConnectionsEnabled = optional(bool)
        allowGuaranteedEndpointCreateDurability = optional(string)
        allowGuaranteedEndpointCreateEnabled = optional(bool)
        allowGuaranteedMsgReceiveEnabled = optional(bool)
        allowGuaranteedMsgSendEnabled = optional(bool)
        allowSharedSubscriptionsEnabled = optional(bool)
        allowTransactedSessionsEnabled = optional(bool)
        apiQueueManagementCopyFromOnCreateTemplateName = optional(string)
        apiTopicEndpointManagementCopyFromOnCreateTemplateName = optional(string)
        compressionEnabled = optional(bool)
        elidingDelay = optional(number)
        elidingEnabled = optional(bool)
        maxConnectionCountPerClientUsername = optional(number)
        maxEgressFlowCount = optional(number)
        maxEndpointCountPerClientUsername = optional(number)
        maxIngressFlowCount = optional(number)
        maxMsgsPerTransaction = optional(number)
        maxSubscriptionCount = optional(number)
        maxTransactedSessionCount = optional(number)
        maxTransactionCount = optional(number)
        queueControl1MaxDepth = optional(number)
        queueControl1MinMsgBurst = optional(number)
        queueDirect1MaxDepth = optional(number)
        queueDirect1MinMsgBurst = optional(number)
        queueDirect2MaxDepth = optional(number)
        queueDirect2MinMsgBurst = optional(number)
        queueDirect3MaxDepth = optional(number)
        queueDirect3MinMsgBurst = optional(number)
        queueGuaranteed1MaxDepth = optional(number)
        queueGuaranteed1MinMsgBurst = optional(number)
        rejectMsgToSenderOnNoSubscriptionMatchEnabled = optional(bool)
        replicationAllowClientConnectWhenStandbyEnabled = optional(bool)
        serviceMinKeepaliveTimeout = optional(number)
        serviceSmfMaxConnectionCountPerClientUsername = optional(number)
        serviceSmfMinKeepaliveEnabled = optional(bool)
        serviceWebInactiveTimeout = optional(number)
        serviceWebMaxConnectionCountPerClientUsername = optional(number)
        serviceWebMaxPayload = optional(number)
        tcpCongestionWindowSize = optional(number)
        tcpKeepaliveCount = optional(number)
        tcpKeepaliveIdleTime = optional(number)
        tcpKeepaliveInterval = optional(number)
        tcpMaxSegmentSize = optional(number)
        tcpMaxWindowSize = optional(number)
        tlsAllowDowngradeToPlainTextEnabled = optional(bool)
        #Thresholds
        eventClientProvisionedEndpointSpoolUsageThreshold = optional(map(number))
        eventConnectionCountPerClientUsernameThreshold = optional(map(number))
        eventEgressFlowCountThreshold = optional(map(number))
        eventEndpointCountPerClientUsernameThreshold = optional(map(number))
        eventIngressFlowCountThreshold = optional(map(number))
        eventServiceSmfConnectionCountPerClientUsernameThreshold = optional(map(number))
        eventServiceWebConnectionCountPerClientUsernameThreshold = optional(map(number))
        eventSubscriptionCountThreshold = optional(map(number))
        eventTransactedSessionCountThreshold = optional(map(number))
        eventTransactionCountThreshold = optional(map(number))
    }))
    default = []
}