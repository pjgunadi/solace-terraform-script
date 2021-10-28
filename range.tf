locals {
  queues = flatten([
    for v in var.Queues_Range : [
      for i in range(v.start, v.limit) : merge({
        "queueName" = format("%s%03d", v.queueNamePrefix, i)
      }, v.properties)
    ]
  ])
  subscriptions = flatten([
    for v in var.Subscriptions_Range : [
      for i in range(v.start, v.limit) : {
        "subscriptionTopic" = format("%s%03d", v.topicPrefix, i)
        "queueName" = format("%s%03d", v.queueNamePrefix, i)
        "msgVpnName" = v.msgVpnName
      }
    ]
  ])
}

resource "restapi_object" "queues_Range" {
  for_each = {
    for v in local.queues : "${v.msgVpnName}.${v.queueName}" => v
  }
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/queues"
  id_attribute = "queueName"
  object_id = urlencode(each.value.queueName)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.msgVpns
  ]
}

resource "restapi_object" "subscriptions_Range" {
  for_each = {
    for v in local.subscriptions : "${v.msgVpnName}.${v.queueName}.${v.subscriptionTopic}" => v
  }
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/queues/${urlencode(each.value.queueName)}/subscriptions"
  id_attribute = "subscriptionTopic"
  object_id = urlencode(each.value.subscriptionTopic)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.queues,
    restapi_object.queues_Range
  ]
}