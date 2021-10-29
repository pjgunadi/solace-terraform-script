variable "Queues_Range" {
    type = list(object({
        start = number
        limit = number
        queueNamePrefix = string
        properties = object({
            msgVpnName = string
            accessType = string
            egressEnabled = bool
            ingressEnabled = bool
            owner = string
            permission = string
        })
    }))
    default = []
}
variable "Subscriptions_Range" {
    type = list(object({
        start = number
        limit = number
        queueNamePrefix = string
        topicPrefix = string
        msgVpnName = string
    }))
    default = []
}
