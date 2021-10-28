
variable "DistributedCaches" {
    type = map(object({
        msgVpnName = string
        cacheName = string
        enabled = bool
        heartbeat = number
        scheduledDeleteMsgDayList = string
        scheduledDeleteMsgTimeList = string
    }))
    default = {}
}

variable "DistributedCacheClusters" {
    type = map(object({
        msgVpnName = string
        cacheName = string
        clusterName = string
        enabled = bool
        deliverToOneOverrideEnabled = bool
        globalCachingEnabled = bool
        msgLifetime = number
        newTopicAdvertisementEnabled = bool

    }))
    default = {}
}

variable "DistributedCacheClusterInstances" {
    type = map(object({
        msgVpnName = string
        cacheName = string
        clusterName = string
        instanceName = string
        enabled = bool
        autoStartEnabled = bool
        stopOnLostMsgEnabled = bool
    }))
    default = {}
}

variable "DistributedCacheClusterTopics" {
    type = map(object({
        msgVpnName = string
        cacheName = string
        clusterName = string
        topic = string
    }))
    default = {}
}

variable "GlobalCachingHomeClusters" {
    type = map(object({
        msgVpnName = string
        cacheName = string
        clusterName = string
        homeClusterName = string
    }))
    default = {}
}

variable "GlobalCachingHomeClusterTopicPrefixes" {
    type = map(object({
        msgVpnName = string
        cacheName = string
        clusterName = string
        homeClusterName = string
        topicPrefix = string
    }))
    default = {}
}
