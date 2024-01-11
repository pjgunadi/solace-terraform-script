
variable "DistributedCaches" {
    type = list(object({
        msgVpnName = string
        cacheName = string
        cacheVirtualRouter = optional(string)
        enabled = optional(bool)
        heartbeat = optional(number)
        scheduledDeleteMsgDayList = optional(string)
        scheduledDeleteMsgTimeList = optional(string)
    }))
    default = []
}

variable "DistributedCacheClusters" {
    type = list(object({
        msgVpnName = string
        cacheName = string
        clusterName = string
        deliverToOneOverrideEnabled = optional(bool)
        enabled = optional(bool)
        globalCachingEnabled = optional(bool)
        globalCachingHeartbeat = optional(number)
        globalCachingTopicLifetime = optional(number)
        maxMemory = optional(number)
        maxMsgPerTopic = optional(number)
        maxRequestQueueDepth = optional(number)
        maxTopicCount = optional(number)
        msgLifetime = optional(number)
        newTopicAdvertisementEnabled = optional(bool)
        #Thresholds
        eventDataByteRateThreshold = optional(map(number))
        eventDataMsgRateThreshold = optional(map(number))
        eventMaxMemoryThreshold = optional(map(number))
        eventMaxTopicsThreshold = optional(map(number))
        eventRequestQueueDepthThreshold = optional(map(number))
        eventRequestRateThreshold = optional(map(number))
        eventResponseRateThreshold = optional(map(number))

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

variable "DistributedCacheClusterInstances" {
    type = list(object({
        msgVpnName = string
        cacheName = string
        clusterName = string
        instanceName = string
        autoStartEnabled = optional(bool)
        enabled = optional(bool)
        stopOnLostMsgEnabled = optional(bool)
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

