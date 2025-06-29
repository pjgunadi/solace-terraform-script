variable "QueueTemplates" {
    type = list(object({
        msgVpnName = string
        queueTemplateName = string
        accessType = optional(string)
        consumerAckPropagationEnabled = optional(bool)
        deadMsgQueue = optional(string)
        deliveryDelay = optional(number)
        durabilityOverride = optional(string)
        eventBindCountThreshold = optional(map(number))
        eventMsgSpoolUsageThreshold = optional(map(number))
        eventRejectLowPriorityMsgLimitThreshold = optional(map(number))
        maxBindCount = optional(number)
        maxDeliveredUnackedMsgsPerFlow = optional(number)
        maxMsgSize = optional(number)
        maxMsgSpoolUsage = optional(number)
        maxRedeliveryCount = optional(number)
        maxTtl = optional(number)
        permission = optional(string)
        queueNameFilter = optional(string)
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