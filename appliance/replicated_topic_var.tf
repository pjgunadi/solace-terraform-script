variable "ReplicatedTopics" {
    type = list(object({
        msgVpnName = string
        replicatedTopic = string
        replicationMode = optional(string)
        #Import Flag 
        _import = optional(bool)
    }))
    default = []
}