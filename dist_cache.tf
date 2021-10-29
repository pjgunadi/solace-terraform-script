
resource "restapi_object" "distributedCaches" {
  for_each = var.DistributedCaches
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/distributedCaches"
  id_attribute = "cacheName"
  object_id = urlencode(each.value.cacheName)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.msgVpns,
  ]
}

resource "restapi_object" "distributedCacheClusters" {
  for_each = var.DistributedCacheClusters
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/distributedCaches/${urlencode(each.value.cacheName)}/clusters"
  id_attribute = "clusterName"
  object_id = urlencode(each.value.clusterName)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.distributedCaches,
  ]
}

resource "restapi_object" "distributedCacheClusterInstances" {
  for_each = var.DistributedCacheClusterInstances
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/distributedCaches/${urlencode(each.value.cacheName)}/clusters/${urlencode(each.value.clusterName)}/instances"
  id_attribute = "instanceName"
  object_id = urlencode(each.value.instanceName)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.distributedCacheClusters,
  ]
}

resource "restapi_object" "distributedCacheClusterTopics" {
  for_each = var.DistributedCacheClusterTopics
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/distributedCaches/${urlencode(each.value.cacheName)}/clusters/${urlencode(each.value.clusterName)}/topics"
  id_attribute = "topic"
  object_id = urlencode(each.value.topic)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.distributedCacheClusters,
  ]
}

resource "restapi_object" "globalCachingHomeClusters" {
  for_each = var.GlobalCachingHomeClusters
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/distributedCaches/${urlencode(each.value.cacheName)}/clusters/${urlencode(each.value.clusterName)}/globalCachingHomeClusters"
  id_attribute = "homeClusterName"
  object_id = urlencode(each.value.homeClusterName)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.distributedCacheClusters,
  ]
}

resource "restapi_object" "globalCachingHomeClusterTopicPrefixes" {
  for_each = var.GlobalCachingHomeClusterTopicPrefixes
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/distributedCaches/${urlencode(each.value.cacheName)}/clusters/${urlencode(each.value.clusterName)}/globalCachingHomeClusters/${urlencode(each.value.homeClusterName)}/topicPrefixes"
  id_attribute = "topicPrefix"
  object_id = urlencode(each.value.topicPrefix)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.globalCachingHomeClusters,
  ]
}

resource "restapi_object" "mqttRetainCaches" {
  for_each = var.MqttRetainCaches
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/mqttRetainCaches"
  id_attribute = "cacheName"
  object_id = urlencode(each.value.cacheName)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.msgVpns,
  ]
}
