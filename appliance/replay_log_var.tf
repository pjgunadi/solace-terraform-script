variable "ReplayLogs" {
    type = list(object({
        msgVpnName = string
        replayLogName = string
        egressEnabled = optional(bool)
        ingressEnabled = optional(bool)
        maxSpoolUsage = optional(number)
        topicFilterEnabled = optional(bool)
        #Import Flag 
        _import = optional(bool)
    }))
    default = []
}

variable "ReplayLogTopicFilterSubscriptions" {
    type = list(object({
        msgVpnName = string
        replayLogName = string
        topicFilterSubscription = string
        #Import Flag 
        _import = optional(bool)
    }))
    default = []
}