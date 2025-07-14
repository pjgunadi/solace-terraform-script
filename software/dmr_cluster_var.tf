variable "DmrClusters" {
    type = list(object({
        dmrClusterName = string
        authenticationBasicEnabled = optional(bool)
        authenticationBasicPassword = optional(string)
        authenticationBasicType = optional(string)
        authenticationClientCertContent = optional(string)
        authenticationClientCertEnabled = optional(bool)
        authenticationClientCertPassword = optional(string)
        directOnlyEnabled = optional(bool)
        enabled = optional(bool)
        tlsServerCertMaxChainDepth = optional(number)
        tlsServerCertValidateDateEnabled = optional(bool)
        tlsServerCertValidateNameEnabled = optional(bool)
        #Import Flag 
        _import = optional(bool)
    }))
    default = []
}

variable "DmrClusterCertMatchingRules" {
    type = list(object({
        dmrClusterName = string
        ruleName = string
        enabled = optional(bool)
        #Import Flag 
        _import = optional(bool)
    }))
    default = []
}

variable "DmrClusterCertMatchingRuleAttributeFilters" {
    type = list(object({
        dmrClusterName = string
        filterName = string
        ruleName = string
        attributeName = optional(string)
        attributeValue = optional(string)
        #Import Flag 
        _import = optional(bool)
    }))
    default = []
}

variable "DmrClusterCertMatchingRuleConditions" {
    type = list(object({
        dmrClusterName = string
        ruleName = string
        source = string
        attribute = optional(string)
        expression = optional(string)
        #Import Flag 
        _import = optional(bool)
    }))
    default = []
}

variable "DmrClusterLinks" {
    type = list(object({
        dmrClusterName = string
        remoteNodeName = string
        authenticationBasicPassword = optional(string)
        authenticationScheme = optional(string)
        clientProfileQueueControl1MaxDepth = optional(number)
        clientProfileQueueControl1MinMsgBurst = optional(number)
        clientProfileQueueDirect1MaxDepth = optional(number)
        clientProfileQueueDirect1MinMsgBurst = optional(number)
        clientProfileQueueDirect2MaxDepth = optional(number)
        clientProfileQueueDirect2MinMsgBurst = optional(number)
        clientProfileQueueDirect3MaxDepth = optional(number)
        clientProfileQueueDirect3MinMsgBurst = optional(number)
        clientProfileQueueGuaranteed1MaxDepth = optional(number)
        clientProfileQueueGuaranteed1MinMsgBurst = optional(number)
        clientProfileTcpCongestionWindowSize = optional(number)
        clientProfileTcpKeepaliveCount = optional(number)
        clientProfileTcpKeepaliveIdleTime = optional(number)
        clientProfileTcpKeepaliveInterval = optional(number)
        clientProfileTcpMaxSegmentSize = optional(number)
        clientProfileTcpMaxWindowSize = optional(number)
        egressFlowWindowSize = optional(number)
        enabled = optional(bool)
        initiator = optional(string)
        queueDeadMsgQueue = optional(string)
        queueEventSpoolUsageThreshold = optional(map(number))
        queueMaxDeliveredUnackedMsgsPerFlow = optional(number)
        queueMaxMsgSpoolUsage = optional(number)
        queueMaxRedeliveryCount = optional(number)
        queueMaxTtl = optional(number)
        queueRejectMsgToSenderOnDiscardBehavior = optional(string)
        queueRespectTtlEnabled = optional(bool)
        span = optional(string)
        transportCompressedEnabled = optional(bool)
        transportTlsEnabled = optional(bool)
        #Import Flag 
        _import = optional(bool)
    }))
    default = []
}

variable "DmrClusterLinkAttributes" {
    type = list(object({
        dmrClusterName = string
        remoteNodeName = string
        attributeName = string
        attributeValue = string
        #Import Flag 
        _import = optional(bool)
    }))
    default = []
}

variable "DmrClusterLinkRemoteAddresses" {
    type = list(object({
        dmrClusterName = string
        remoteNodeName = string
        remoteAddress = string
        #Import Flag 
        _import = optional(bool)
    }))
    default = []
}