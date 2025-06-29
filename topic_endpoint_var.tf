variable "TopicEndpoints" {
    type = list(object({
        msgVpnName = string
        topicEndpointName = string
        accessType = optional(string)
        consumerAckPropagationEnabled = optional(bool)
        deadMsgQueue = optional(string)
        deliveryCountEnabled = optional(bool)
        deliveryDelay = optional(number)
        egressEnabled = optional(bool)
        eventBindCountThreshold = optional(map(number))
        eventRejectLowPriorityMsgLimitThreshold = optional(map(number))
        eventSpoolUsageThreshold = optional(map(number))
        ingressEnabled = optional(bool)
        maxBindCount = optional(number)
        maxDeliveredUnackedMsgsPerFlow = optional(number)
        maxMsgSize = optional(number)
        maxRedeliveryCount = optional(number)
        maxSpoolUsage = optional(number)
        maxTtl = optional(number)
        owner = optional(string)
        permission = optional(string)
        redeliveryDelayEnabled = optional(bool)
        redeliveryDelayInitialInterval = optional(number)
        redeliveryDelayMaxInterval = optional(number)
        redeliveryDelayMultiplier = optional(number)
        redeliveryEnabled = optional(bool)
        rejectLowPriorityMsgEnabled = optional(bool)
        rejectLowPriorityMsgLimit = optional(number)
        rejectMsgToSenderOnDiscardBehavior = optional(string)
        respectMsgPriorityEnabled = optional(bool)
        respectTtlEnabled = optional(bool)
        
        #Import Flag 
        _import = optional(bool)
    }))
    default = []
}