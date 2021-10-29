
variable "DistributedCaches" {
    type = list(object({
        msgVpnName = string
        cacheName = string
        enabled = bool
        heartbeat = number
        scheduledDeleteMsgDayList = string
        scheduledDeleteMsgTimeList = string
    }))
    default = []
}

variable "DistributedCacheClusters" {
    type = list(object({
        msgVpnName = string
        cacheName = string
        clusterName = string
        enabled = bool
        deliverToOneOverrideEnabled = bool
        globalCachingEnabled = bool
        msgLifetime = number
        newTopicAdvertisementEnabled = bool

    }))
    default = []
}

variable "DistributedCacheClusterInstances" {
    type = list(object({
        msgVpnName = string
        cacheName = string
        clusterName = string
        instanceName = string
        enabled = bool
        autoStartEnabled = bool
        stopOnLostMsgEnabled = bool
    }))
    default = []
}

variable "DistributedCacheClusterTopics" {
    type = list(object({
        msgVpnName = string
        cacheName = string
        clusterName = string
        topic = string
    }))
    default = []
}

variable "GlobalCachingHomeClusters" {
    type = list(object({
        msgVpnName = string
        cacheName = string
        clusterName = string
        homeClusterName = string
    }))
    default = []
}

variable "GlobalCachingHomeClusterTopicPrefixes" {
    type = list(object({
        msgVpnName = string
        cacheName = string
        clusterName = string
        homeClusterName = string
        topicPrefix = string
    }))
    default = []
}

variable "MqttRetainCaches" {
    type = list(object({
        msgVpnName = string
        cacheName = string
        enabled = bool
        msgLifetime = number
    }))
    default = []
}
