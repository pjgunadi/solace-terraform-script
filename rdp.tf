
resource "restapi_object" "restDeliveryPoints" {
  for_each = {
    for v in var.RestDeliveryPoints : "${v.msgVpnName}.${v.restDeliveryPointName}" => v
  }
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/restDeliveryPoints"
  id_attribute = "restDeliveryPointName"
  object_id = urlencode(each.value.restDeliveryPointName)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.msgVpns
  ]
}

resource "restapi_object" "rdpQueueBindings" {
  for_each = {
    for v in var.RdpQueueBindings : "${v.msgVpnName}.${v.restDeliveryPointName}.${v.queueBindingName}" => v
  }
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/restDeliveryPoints/${urlencode(each.value.restDeliveryPointName)}/queueBindings"
  id_attribute = "queueBindingName"
  object_id = urlencode(each.value.queueBindingName)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.restDeliveryPoints
  ]
}

resource "restapi_object" "rdpQueueBindingRequestHeaders" {
  for_each = {
    for v in var.RdpQueueBindingRequestHeaders : "${v.msgVpnName}.${v.restDeliveryPointName}.${v.queueBindingName}.${v.headerName}" => v
  }
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/restDeliveryPoints/${urlencode(each.value.restDeliveryPointName)}/queueBindings/${urlencode(each.value.queueBindingName)}/requestHeaders"
  id_attribute = "headerName"
  object_id = urlencode(each.value.headerName)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.rdpQueueBindings
  ]
}

resource "restapi_object" "rdpRestConsumers" {
  for_each = {
    for v in var.RdpRestConsumers : "${v.msgVpnName}.${v.restDeliveryPointName}.${v.restConsumerName}" => v
  }
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/restDeliveryPoints/${urlencode(each.value.restDeliveryPointName)}/restConsumers"
  id_attribute = "restConsumerName"
  object_id = urlencode(each.value.restConsumerName)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.restDeliveryPoints
  ]
}

resource "restapi_object" "rdpRestConsumerOauthJwtClaims" {
  for_each = {
    for v in var.RdpRestConsumerOauthJwtClaims : "${v.msgVpnName}.${v.restDeliveryPointName}.${v.restConsumerName}.${v.oauthJwtClaimName}" => v
  }
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/restDeliveryPoints/${urlencode(each.value.restDeliveryPointName)}/restConsumers/${urlencode(each.value.restConsumerName)}/oauthJwtClaims"
  id_attribute = "oauthJwtClaimName"
  object_id = urlencode(each.value.oauthJwtClaimName)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.rdpRestConsumers
  ]
}