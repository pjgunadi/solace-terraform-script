variable "ReplicatedTopics" {
    type = list(object({
        msgVpnName = string
        replicatedTopic = string
        replicationMode = optional(string)

    }))
    default = []
}