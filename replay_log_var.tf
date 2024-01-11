variable "ReplayLogs" {
    type = list(object({
        msgVpnName = string
        replayLogName = string
        egressEnabled = optional(bool)
        ingressEnabled = optional(bool)
        maxSpoolUsage = optional(number)
        topicFilterEnabled = optional(bool)
    }))
    default = []
}

variable "ReplayLogTopicFilterSubscriptions" {
    type = list(object({
        msgVpnName = string
        replayLogName = string
        topicFilterSubscription = string
    }))
    default = []
}