provider "restapi" {
  uri = var.solace_host.uri
  insecure = var.solace_host.insecure
  username = var.solace_host.username
  password = var.solace_host.password
  write_returns_object = var.solace_host.write_returns_object
  debug = var.solace_host.debug
}

resource "restapi_object" "msgVpns" {
  for_each = {
    for v in var.MsgVpns : "${v.msgVpnName}" => v
  }
  path = "/msgVpns"
  id_attribute = "msgVpnName"
  object_id = urlencode(each.value.msgVpnName)
  data = jsonencode(each.value)
}

resource "restapi_object" "aclProfiles" {
  for_each = {
    for v in var.AclProfiles : "${v.msgVpnName}.${v.aclProfileName}" => v
  }
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/aclProfiles"
  id_attribute = "aclProfileName"
  object_id = urlencode(each.value.aclProfileName)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.msgVpns
  ]
}

resource "restapi_object" "clientConnectExceptions" {
  for_each = {
    for v in var.ClientConnectExceptions : "${v.msgVpnName}.${v.aclProfileName}.${v.clientConnectExceptionAddress}" => v
  }
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/aclProfiles/${urlencode(each.value.aclProfileName)}/clientConnectExceptions"
  id_attribute = "clientConnectExceptionAddress"
  object_id = urlencode(each.value.clientConnectExceptionAddress)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.aclProfiles
  ]
}

resource "restapi_object" "publishTopicExceptions" {
  for_each = {
    for v in var.PublishTopicExceptions : "${v.msgVpnName}.${v.aclProfileName}.${v.publishTopicException}.${v.publishTopicExceptionSyntax}" => v
  }
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/aclProfiles/${urlencode(each.value.aclProfileName)}/publishTopicExceptions"
  id_attribute = "publishTopicException"
  object_id = urlencode(each.value.publishTopicException)
  destroy_path = "/msgVpns/${urlencode(each.value.msgVpnName)}/aclProfiles/${urlencode(each.value.aclProfileName)}/publishTopicExceptions/${urlencode(each.value.publishTopicExceptionSyntax)},{id}"
  read_path = "/msgVpns/${urlencode(each.value.msgVpnName)}/aclProfiles/${urlencode(each.value.aclProfileName)}/publishTopicExceptions/${urlencode(each.value.publishTopicExceptionSyntax)},{id}"
  data = jsonencode(each.value)

  depends_on = [
    restapi_object.aclProfiles
  ]
}

resource "restapi_object" "subscribeTopicExceptions" {
  for_each = {
    for v in var.SubscribeTopicExceptions : "${v.msgVpnName}.${v.aclProfileName}.${v.subscribeTopicException}.${v.subscribeTopicExceptionSyntax}" => v
  }
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/aclProfiles/${urlencode(each.value.aclProfileName)}/subscribeTopicExceptions"
  id_attribute = "subscribeTopicException"
  object_id = urlencode(each.value.subscribeTopicException)
  destroy_path = "/msgVpns/${urlencode(each.value.msgVpnName)}/aclProfiles/${urlencode(each.value.aclProfileName)}/subscribeTopicExceptions/${urlencode(each.value.subscribeTopicExceptionSyntax)},{id}"
  read_path = "/msgVpns/${urlencode(each.value.msgVpnName)}/aclProfiles/${urlencode(each.value.aclProfileName)}/subscribeTopicExceptions/${urlencode(each.value.subscribeTopicExceptionSyntax)},{id}"
  data = jsonencode(each.value)

  depends_on = [
    restapi_object.aclProfiles
  ]
}

resource "restapi_object" "subscribeShareNameExceptions" {
  for_each =  {
    for v in var.SubscribeShareNameExceptions : "${v.msgVpnName}.${v.aclProfileName}.${v.subscribeShareNameException}.${v.subscribeShareNameExceptionSyntax}" => v
  }
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/aclProfiles/${urlencode(each.value.aclProfileName)}/subscribeShareNameExceptions"
  id_attribute = "subscribeShareNameException"
  object_id = urlencode(each.value.subscribeShareNameException)
  destroy_path = "/msgVpns/${urlencode(each.value.msgVpnName)}/aclProfiles/${urlencode(each.value.aclProfileName)}/subscribeShareNameExceptions/${urlencode(each.value.subscribeShareNameExceptionSyntax)},{id}"
  read_path = "/msgVpns/${urlencode(each.value.msgVpnName)}/aclProfiles/${urlencode(each.value.aclProfileName)}/subscribeShareNameExceptions/${urlencode(each.value.subscribeShareNameExceptionSyntax)},{id}"
  data = jsonencode(each.value)

  depends_on = [
    restapi_object.aclProfiles
  ]
}

resource "restapi_object" "clientProfiles" {
  for_each = {
    for v in var.ClientProfiles : "${v.msgVpnName}.${v.clientProfileName}" => v
  }
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/clientProfiles"
  id_attribute = "clientProfileName"
  object_id = urlencode(each.value.clientProfileName)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.msgVpns
  ]
}

resource "restapi_object" "clientUsernames" {
  for_each = {
    for v in var.ClientUsernames : "${v.msgVpnName}.${v.clientUsername}" => v
  }
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/clientUsernames"
  id_attribute = "clientUsername"
  object_id = urlencode(each.value.clientUsername)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.msgVpns,
    restapi_object.aclProfiles,
    restapi_object.clientProfiles
  ]
}

resource "restapi_object" "authorizationGroups" {
  for_each = {
    for v in var.AuthorizationGroups : "${v.msgVpnName}.${v.authorizationGroupName}" => v
  }
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/authorizationGroups"
  id_attribute = "authorizationGroupName"
  object_id = urlencode(each.value.authorizationGroupName)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.msgVpns,
    restapi_object.aclProfiles,
    restapi_object.clientProfiles
  ]
}

resource "restapi_object" "queues" {
  for_each = {
    for v in var.Queues : "${v.msgVpnName}.${v.queueName}" => v
  }
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/queues"
  id_attribute = "queueName"
  object_id = urlencode(each.value.queueName)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.msgVpns
  ]
}

resource "restapi_object" "subscriptions" {
  for_each = {
    for v in var.Subscriptions : "${v.msgVpnName}.${v.queueName}.${v.subscriptionTopic}" => v
  }
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/queues/${urlencode(each.value.queueName)}/subscriptions"
  id_attribute = "subscriptionTopic"
  object_id = urlencode(each.value.subscriptionTopic)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.queues
  ]
}

resource "restapi_object" "bridges" {
  for_each = {
    for v in var.Bridges : "${v.msgVpnName}.${v.bridgeName}.${v.bridgeVirtualRouter}" => v
  }
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/bridges"
  id_attribute = "bridgeName"
  object_id = urlencode(each.value.bridgeName)
  read_path = "/msgVpns/${urlencode(each.value.msgVpnName)}/bridges/{id},${urlencode(each.value.bridgeVirtualRouter)}"
  update_path = "/msgVpns/${urlencode(each.value.msgVpnName)}/bridges/{id},${urlencode(each.value.bridgeVirtualRouter)}"
  destroy_path = "/msgVpns/${urlencode(each.value.msgVpnName)}/bridges/{id},${urlencode(each.value.bridgeVirtualRouter)}"
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.msgVpns,
  ]
}

resource "restapi_object" "remoteMsgVpns" {
  for_each = {
    for v in var.RemoteMsgVpns : "${v.msgVpnName}.${v.bridgeName}.${v.bridgeVirtualRouter}.${v.remoteMsgVpnName}.${v.remoteMsgVpnLocation}" => v
  }
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/bridges/${urlencode(each.value.bridgeName)},${urlencode(each.value.bridgeVirtualRouter)}/remoteMsgVpns"
  id_attribute = "remoteMsgVpnName"
  object_id = urlencode(each.value.remoteMsgVpnName)
  force_new = ["${each.value.remoteMsgVpnInterface}"]
  read_path = "/msgVpns/${urlencode(each.value.msgVpnName)}/bridges/${urlencode(each.value.bridgeName)},${urlencode(each.value.bridgeVirtualRouter)}/remoteMsgVpns/{id},${urlencode(each.value.remoteMsgVpnLocation)},${urlencode(each.value.remoteMsgVpnInterface)}"
  update_path = "/msgVpns/${urlencode(each.value.msgVpnName)}/bridges/${urlencode(each.value.bridgeName)},${urlencode(each.value.bridgeVirtualRouter)}/remoteMsgVpns/{id},${urlencode(each.value.remoteMsgVpnLocation)},${urlencode(each.value.remoteMsgVpnInterface)}"
  destroy_path = "/msgVpns/${urlencode(each.value.msgVpnName)}/bridges/${urlencode(each.value.bridgeName)},${urlencode(each.value.bridgeVirtualRouter)}/remoteMsgVpns/{id},${urlencode(each.value.remoteMsgVpnLocation)},${urlencode(each.value.remoteMsgVpnInterface)}"
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.bridges
  ]
}

resource "restapi_object" "remoteSubscriptions" {
  for_each = {
    for v in var.RemoteSubscriptions : "${v.msgVpnName}.${v.bridgeName}.${v.bridgeVirtualRouter}.${v.remoteSubscriptionTopic}" => v
  }
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/bridges/${urlencode(each.value.bridgeName)},${urlencode(each.value.bridgeVirtualRouter)}/remoteSubscriptions"
  id_attribute = "remoteSubscriptionTopic"
  object_id = urlencode(each.value.remoteSubscriptionTopic)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.bridges
  ]
}

resource "restapi_object" "clientCertAuthorities" {
  for_each = {
    for v in var.ClientCertAuthorities : "${v.certAuthorityName}" => v
  }
  path = "/clientCertAuthorities"
  id_attribute = "certAuthorityName"
  object_id = urlencode(each.value.certAuthorityName)
  data = jsonencode(each.value)
}

resource "restapi_object" "ocspTlsTrustedCommonNames" {
  for_each = {
    for v in var.OcspTlsTrustedCommonNames : "${v.certAuthorityName}.${v.ocspTlsTrustedCommonNames}" => v
  }
  path = "/clientCertAuthorities/${urlencode(each.value.certAuthorityName)}/ocspTlsTrustedCommonNames"
  id_attribute = "ocspTlsTrustedCommonNames"
  object_id = urlencode(each.value.ocspTlsTrustedCommonNames)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.clientCertAuthorities
  ]
}

resource "restapi_object" "dmrClusters" {
  for_each = {
    for v in var.DmrClusters : "${v.dmrClusterName}" => v
  }
  path = "/dmrClusters"
  id_attribute = "dmrClusterName"
  object_id = urlencode(each.value.dmrClusterName)
  data = jsonencode(each.value)
}

resource "restapi_object" "dmrLinks" {
  for_each = {
    for v in var.DmrLinks : "${v.dmrClusterName}.${v.remoteNodeName}" => v
  }
  path = "/dmrClusters/${urlencode(each.value.dmrClusterName)}/links"
  id_attribute = "remoteNodeName"
  object_id = urlencode(each.value.remoteNodeName)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.dmrClusters
  ]
}

resource "restapi_object" "dmrLinkRemoteAddresses" {
  for_each = {
    for v in var.DmrLinkRemoteAddresses : "${v.dmrClusterName}.${v.remoteNodeName}.${v.remoteAddress}" => v
  }
  path = "/dmrClusters/${urlencode(each.value.dmrClusterName)}/links/${urlencode(each.value.remoteNodeName)}/remoteAddresses"
  id_attribute = "remoteAddress"
  object_id = urlencode(each.value.remoteAddress)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.dmrLinks
  ]
}

resource "restapi_object" "domainCertAuthorities" {
  for_each = {
    for v in var.DomainCertAuthorities : "${v.certAuthorityName}" => v
  }
  path = "/domainCertAuthorities"
  id_attribute = "certAuthorityName"
  object_id = urlencode(each.value.certAuthorityName)
  data = jsonencode(each.value)
}

resource "restapi_object" "authenticationOauthProviders" {
  for_each = {
    for v in var.AuthenticationOauthProviders : "${v.msgVpnName}.${v.oauthProviderName}" => v
  }
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/authenticationOauthProviders"
  id_attribute = "oauthProviderName"
  object_id = urlencode(each.value.oauthProviderName)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.msgVpns,
  ]
}

resource "restapi_object" "dmrBridges" {
  for_each = {
    for v in var.DmrBridges : "${v.msgVpnName}.${v.remoteNodeName}" => v
  }
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/dmrBridges"
  id_attribute = "remoteNodeName"
  object_id = urlencode(each.value.remoteNodeName)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.msgVpns,
  ]
}

resource "restapi_object" "jndiConnectionFactories" {
  for_each = {
    for v in var.JndiConnectionFactories : "${v.msgVpnName}.${v.connectionFactoryName}" => v
  }
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/jndiConnectionFactories"
  id_attribute = "connectionFactoryName"
  object_id = urlencode(each.value.connectionFactoryName)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.msgVpns,
  ]
}

resource "restapi_object" "jndiQueues" {
  for_each = {
    for v in var.JndiQueues : "${v.msgVpnName}.${v.queueName}" => v
  }
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/jndiQueues"
  id_attribute = "queueName"
  object_id = urlencode(each.value.queueName)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.msgVpns,
  ]
}

resource "restapi_object" "jndiTopics" {
  for_each = {
    for v in var.JndiTopics : "${v.msgVpnName}.${v.topicName}" => v
  }
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/jndiTopics"
  id_attribute = "topicName"
  object_id = urlencode(each.value.topicName)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.msgVpns,
  ]
}

resource "restapi_object" "mqttSessions" {
  for_each = {
    for v in var.MqttSessions : "${v.msgVpnName}.${v.mqttSessionClientId}" => v
  }
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/mqttSessions"
  id_attribute = "mqttSessionClientId"
  object_id = urlencode(each.value.mqttSessionClientId)
  force_new = ["${each.value.mqttSessionVirtualRouter}"]
  read_path = "/msgVpns/${urlencode(each.value.msgVpnName)}/mqttSessions/{id},${urlencode(each.value.mqttSessionVirtualRouter)}"
  update_path = "/msgVpns/${urlencode(each.value.msgVpnName)}/mqttSessions/{id},${urlencode(each.value.mqttSessionVirtualRouter)}"
  destroy_path = "/msgVpns/${urlencode(each.value.msgVpnName)}/mqttSessions/{id},${urlencode(each.value.mqttSessionVirtualRouter)}"
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.msgVpns,
  ]
}

resource "restapi_object" "mqttSessionSubscriptions" {
  for_each = {
    for v in var.MqttSessionSubscriptions : "${v.msgVpnName}.${v.mqttSessionClientId}.${v.subscriptionTopic}" => v
  }
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/mqttSessions/{id},${urlencode(each.value.mqttSessionVirtualRouter)}/subscriptions"
  id_attribute = "subscriptionTopic"
  object_id = urlencode(each.value.subscriptionTopic)
  force_new = ["${each.value.mqttSessionVirtualRouter}"]
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.mqttSessions,
  ]
}

resource "restapi_object" "queueTemplates" {
  for_each = {
    for v in var.QueueTemplates : "${v.msgVpnName}.${v.queueTemplateName}" => v
  }
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/queueTemplates"
  id_attribute = "queueTemplateName"
  object_id = urlencode(each.value.queueTemplateName)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.msgVpns
  ]
}

resource "restapi_object" "replayLogs" {
  for_each = {
    for v in var.ReplayLogs : "${v.msgVpnName}.${v.replayLogName}" => v
  }
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/replayLogs"
  id_attribute = "replayLogName"
  object_id = urlencode(each.value.replayLogName)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.msgVpns
  ]
}

resource "restapi_object" "replicatedTopics" {
  for_each = {
    for v in var.ReplicatedTopics : "${v.msgVpnName}.${v.replicatedTopic}" => v
  }
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/replicatedTopics"
  id_attribute = "replicatedTopic"
  object_id = urlencode(each.value.replicatedTopic)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.msgVpns
  ]
}

resource "restapi_object" "topicEndpointTemplates" {
  for_each = {
    for v in var.TopicEndpointTemplates : "${v.msgVpnName}.${v.topicEndpointTemplateName}" => v
  }
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/topicEndpointTemplates"
  id_attribute = "topicEndpointTemplateName"
  object_id = urlencode(each.value.topicEndpointTemplateName)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.msgVpns
  ]
}

resource "restapi_object" "topicEndpoints" {
  for_each = {
    for v in var.TopicEndpoints : "${v.msgVpnName}.${v.topicEndpointName}" => v
  }
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/topicEndpoints"
  id_attribute = "topicEndpointName"
  object_id = urlencode(each.value.topicEndpointName)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.msgVpns
  ]
}

resource "restapi_object" "virtualHostnames" {
  for_each = {
    for v in var.VirtualHostnames : "${v.virtualHostname}" => v
  }
  path = "/virtualHostnames"
  id_attribute = "virtualHostname"
  object_id = urlencode(each.value.virtualHostname)
  data = jsonencode(each.value)
}