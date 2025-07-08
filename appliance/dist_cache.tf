
resource "solacebrokerappliance_msg_vpn_distributed_cache" "distributedCaches" {
  for_each = {
    for v in var.DistributedCaches : "${v.msgVpnName}.${v.cacheName}" => v
  }
  msg_vpn_name = each.value.msgVpnName
  cache_name = each.value.cacheName
  cache_virtual_router = each.value.cacheVirtualRouter
  enabled = each.value.enabled
  heartbeat = each.value.heartbeat
  scheduled_delete_msg_day_list = each.value.scheduledDeleteMsgDayList
  scheduled_delete_msg_time_list = each.value.scheduledDeleteMsgTimeList

  depends_on = [
    solacebrokerappliance_msg_vpn.msgVpns,
  ]
}

resource "solacebrokerappliance_msg_vpn_distributed_cache_cluster" "distributedCacheClusters" {
  for_each = {
    for v in var.DistributedCacheClusters : "${v.msgVpnName}.${v.cacheName}.${v.clusterName}" => v
  }
  msg_vpn_name = each.value.msgVpnName
  cache_name = each.value.cacheName
  cluster_name = each.value.clusterName
  deliver_to_one_override_enabled = each.value.deliverToOneOverrideEnabled
  enabled = each.value.enabled
  global_caching_enabled = each.value.globalCachingEnabled
  global_caching_heartbeat = each.value.globalCachingHeartbeat
  global_caching_topic_lifetime = each.value.globalCachingTopicLifetime
  max_memory = each.value.maxMemory
  max_msgs_per_topic = each.value.maxMsgPerTopic
  max_request_queue_depth = each.value.maxRequestQueueDepth
  max_topic_count = each.value.maxTopicCount
  msg_lifetime = each.value.msgLifetime
  new_topic_advertisement_enabled = each.value.newTopicAdvertisementEnabled
  #Thresholds
  event_data_byte_rate_threshold = each.value.eventDataByteRateThreshold
  event_data_msg_rate_threshold = each.value.eventDataMsgRateThreshold
  event_max_memory_threshold = each.value.eventMaxMemoryThreshold
  event_max_topics_threshold = each.value.eventMaxTopicsThreshold
  event_request_queue_depth_threshold = each.value.eventRequestQueueDepthThreshold
  event_request_rate_threshold = each.value.eventRequestRateThreshold
  event_response_rate_threshold = each.value.eventResponseRateThreshold

  depends_on = [
    solacebrokerappliance_msg_vpn_distributed_cache.distributedCaches,
  ]
}

resource "solacebrokerappliance_msg_vpn_distributed_cache_cluster_global_caching_home_cluster" "globalCachingHomeClusters" {
  for_each = {
    for v in var.GlobalCachingHomeClusters : "${v.msgVpnName}.${v.cacheName}.${v.clusterName}.${v.homeClusterName}" => v
  }
  
  msg_vpn_name = each.value.msgVpnName
  cache_name = each.value.cacheName
  cluster_name = each.value.clusterName
  home_cluster_name = each.value.homeClusterName

  depends_on = [
    solacebrokerappliance_msg_vpn_distributed_cache_cluster.distributedCacheClusters,
  ]
}

resource "solacebrokerappliance_msg_vpn_distributed_cache_cluster_global_caching_home_cluster_topic_prefix" "globalCachingHomeClusterTopicPrefixes" {
  for_each = {
    for v in var.GlobalCachingHomeClusterTopicPrefixes : "${v.msgVpnName}.${v.cacheName}.${v.clusterName}.${v.homeClusterName}.${v.topicPrefix}" => v
  }
  msg_vpn_name = each.value.msgVpnName
  cache_name = each.value.cacheName
  cluster_name = each.value.clusterName
  home_cluster_name = each.value.homeClusterName
  topic_prefix = each.value.topicPrefix

  depends_on = [
    solacebrokerappliance_msg_vpn_distributed_cache_cluster_global_caching_home_cluster.globalCachingHomeClusters,
  ]
}

resource "solacebrokerappliance_msg_vpn_distributed_cache_cluster_instance" "distributedCacheClusterInstances" {
  for_each = {
    for v in var.DistributedCacheClusterInstances : "${v.msgVpnName}.${v.cacheName}.${v.clusterName}.${v.instanceName}" => v
  }
  
  msg_vpn_name = each.value.msgVpnName
  cache_name = each.value.cacheName
  cluster_name = each.value.clusterName
  instance_name = each.value.instanceName
  auto_start_enabled = each.value.autoStartEnabled
  enabled = each.value.enabled
  stop_on_lost_msg_enabled = each.value.stopOnLostMsgEnabled

  depends_on = [
    solacebrokerappliance_msg_vpn_distributed_cache_cluster.distributedCacheClusters,
  ]
}

resource "solacebrokerappliance_msg_vpn_distributed_cache_cluster_topic" "distributedCacheClusterTopics" {
  for_each = {
    for v in var.DistributedCacheClusterTopics : "${v.msgVpnName}.${v.cacheName}.${v.clusterName}.${v.topic}" => v
  }
  
  msg_vpn_name = each.value.msgVpnName
  cache_name = each.value.cacheName
  cluster_name = each.value.clusterName
  topic = each.value.topic

  depends_on = [
    solacebrokerappliance_msg_vpn_distributed_cache_cluster.distributedCacheClusters,
  ]
}

# Import
import {
  for_each = {
    for v in var.DistributedCaches : "${v.msgVpnName}.${v.cacheName}" => "${urlencode(v.msgVpnName)}/${urlencode(v.cacheName)}" if v._import==true
  }

  to = solacebrokerappliance_msg_vpn_distributed_cache.distributedCaches[each.key]
  id = each.value
}

import {
  for_each = {
    for v in var.DistributedCacheClusters : "${v.msgVpnName}.${v.cacheName}.${v.clusterName}" => "${urlencode(v.msgVpnName)}/${urlencode(v.cacheName)}/${urlencode(v.clusterName)}" if v._import==true
  }

  to = solacebrokerappliance_msg_vpn_distributed_cache_cluster.distributedCacheClusters[each.key]
  id = each.value
}

import {
  for_each = {
    for v in var.GlobalCachingHomeClusters : "${v.msgVpnName}.${v.cacheName}.${v.clusterName}.${v.homeClusterName}" => "${urlencode(v.msgVpnName)}/${urlencode(v.cacheName)}/${urlencode(v.clusterName)}/${urlencode(v.homeClusterName)}" if v._import==true
  }

  to = solacebrokerappliance_msg_vpn_distributed_cache_cluster_global_caching_home_cluster.globalCachingHomeClusters[each.key]
  id = each.value
}

import {
  for_each = {
    for v in var.GlobalCachingHomeClusterTopicPrefixes : "${v.msgVpnName}.${v.cacheName}.${v.clusterName}.${v.homeClusterName}.${v.topicPrefix}" => "${urlencode(v.msgVpnName)}/${urlencode(v.cacheName)}/${urlencode(v.clusterName)}/${urlencode(v.homeClusterName)}/${urlencode(v.topicPrefix)}" if v._import==true
  }

  to = solacebrokerappliance_msg_vpn_distributed_cache_cluster_global_caching_home_cluster_topic_prefix.globalCachingHomeClusterTopicPrefixes[each.key]
  id = each.value
}

import {
  for_each = {
    for v in var.DistributedCacheClusterInstances : "${v.msgVpnName}.${v.cacheName}.${v.clusterName}.${v.instanceName}" => "${urlencode(v.msgVpnName)}/${urlencode(v.cacheName)}/${urlencode(v.clusterName)}/${urlencode(v.instanceName)}" if v._import==true
  }

  to = solacebrokerappliance_msg_vpn_distributed_cache_cluster_instance.distributedCacheClusterInstances[each.key]
  id = each.value
}

import {
  for_each = {
    for v in var.DistributedCacheClusterTopics : "${v.msgVpnName}.${v.cacheName}.${v.clusterName}.${v.topic}" => "${urlencode(v.msgVpnName)}/${urlencode(v.cacheName)}/${urlencode(v.clusterName)}/${urlencode(v.topic)}" if v._import==true
  }

  to = solacebrokerappliance_msg_vpn_distributed_cache_cluster_topic.distributedCacheClusterTopics[each.key]
  id = each.value
}
