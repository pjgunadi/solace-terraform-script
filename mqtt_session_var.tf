variable "MqttSessions" {
    type = list(object({
        mqttSessionClientId = string
        mqttSessionVirtualRouter = string
        msgVpnName = string
        enabled = optional(bool)
        owner = optional(string)
        queueConsumerAckPropagationEnabled = optional(bool)
        queueDeadMsgQueue = optional(string)
        queueEventBindCountThreshold = optional(map(number))
        queueEventMsgSpoolUsageThreshold = optional(map(number))
        queueEventRejectLowPriorityMsgLimitThreshold = optional(map(number))
        queueMaxBindCount = optional(number)
        queueMaxDeliveredUnackedMsgsPerFlow = optional(number)
        queueMaxMsgSize = optional(number)
        queueMaxMsgSpoolUsage = optional(number)
        queueMaxRedeliveryCount = optional(number)
        queueMaxTtl = optional(number)
        queueRejectLowPriorityMsgEnabled = optional(bool)
        queueRejectLowPriorityMsgLimit = optional(number)
        queueRejectMsgToSenderOnDiscardBehavior = optional(string)
        queueRespectTtlEnabled = optional(bool)
    }))
    default = []
}

variable "MqttSessionSubscriptions" {
    type = list(object({
        msgVpnName = string
        mqttSessionClientId = string
        mqttSessionVirtualRouter = string
        subscriptionTopic = string
        subscriptionQos = optional(number)
    }))
    default = []
}
