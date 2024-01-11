variable "Queues" {
    type = list(object({
        queueName = string
        msgVpnName = string
        accessType = optional(string)
        consumerAckPropagationEnabled = optional(bool)
        deadMsgQueue = optional(string)
        deliveryCountEnabled = optional(bool)
        deliveryDelay = optional(number)
        egressEnabled = optional(bool)
        ingressEnabled = optional(bool)
        maxBindCount = optional(number)
        maxDeliveredUnackedMsgsPerFlow = optional(number)
        maxMsgSize = optional(number)
        maxMsgSpoolUsage = optional(number)
        maxRedeliveryCount = optional(number)
        maxTtl = optional(number)
        owner = optional(string)
        partitionCount = optional(number)
        partitionRebalanceDelay = optional(number)
        partitionRebalanceMaxHandoffTime = optional(number)
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
        #Thresholds
        eventBindCountThreshold = optional(map(number))
        eventMsgSpoolUsageThreshold = optional(map(number))
        eventRejectLowPriorityMsgLimitThreshold = optional(map(number))
    }))
    default = []
}

variable "Subscriptions" {
    type = list(object({
        subscriptionTopic = string
        queueName = string
        msgVpnName = string
    }))
    default = []
}