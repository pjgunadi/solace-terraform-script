provider "restapi" {
  uri = var.solace_host.uri
  insecure = var.solace_host.insecure
  username = var.solace_host.username
  password = var.solace_host.password
  write_returns_object = var.solace_host.write_returns_object
  debug = var.solace_host.debug
}

resource "restapi_object" "msgVpns" {
  for_each = var.MsgVpns
  path = "/msgVpns"
  id_attribute = "msgVpnName"
  object_id = urlencode(each.value.msgVpnName)
  data = jsonencode(each.value)
}

resource "restapi_object" "aclProfiles" {
  for_each = var.AclProfiles
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/aclProfiles"
  id_attribute = "aclProfileName"
  object_id = urlencode(each.value.aclProfileName)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.msgVpns
  ]
}

resource "restapi_object" "clientConnectExceptions" {
  for_each = var.ClientConnectExceptions
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/aclProfiles/${urlencode(each.value.aclProfileName)}/clientConnectExceptions"
  id_attribute = "clientConnectExceptionAddress"
  object_id = urlencode(each.value.clientConnectExceptionAddress)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.aclProfiles
  ]
}

resource "restapi_object" "publishTopicExceptions" {
  for_each = var.PublishTopicExceptions
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/aclProfiles/${urlencode(each.value.aclProfileName)}/publishTopicExceptions"
  id_attribute = "publishTopicException"
  object_id = urlencode(each.value.publishTopicException)
  force_new = ["publishTopicException","publishTopicExceptionSyntax"]
  destroy_path = "/msgVpns/${urlencode(each.value.msgVpnName)}/aclProfiles/${urlencode(each.value.aclProfileName)}/publishTopicExceptions/${urlencode(each.value.publishTopicExceptionSyntax)},{id}"
  read_path = "/msgVpns/${urlencode(each.value.msgVpnName)}/aclProfiles/${urlencode(each.value.aclProfileName)}/publishTopicExceptions/${urlencode(each.value.publishTopicExceptionSyntax)},{id}"
  data = jsonencode(each.value)

  depends_on = [
    restapi_object.aclProfiles
  ]
}

resource "restapi_object" "subscribeTopicExceptions" {
  for_each = var.SubscribeTopicExceptions
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/aclProfiles/${urlencode(each.value.aclProfileName)}/subscribeTopicExceptions"
  id_attribute = "subscribeTopicException"
  object_id = urlencode(each.value.subscribeTopicException)
  force_new = ["subscribeTopicException","subscribeTopicExceptionSyntax"]
  destroy_path = "/msgVpns/${urlencode(each.value.msgVpnName)}/aclProfiles/${urlencode(each.value.aclProfileName)}/subscribeTopicExceptions/${urlencode(each.value.subscribeTopicExceptionSyntax)},{id}"
  read_path = "/msgVpns/${urlencode(each.value.msgVpnName)}/aclProfiles/${urlencode(each.value.aclProfileName)}/subscribeTopicExceptions/${urlencode(each.value.subscribeTopicExceptionSyntax)},{id}"
  data = jsonencode(each.value)

  depends_on = [
    restapi_object.aclProfiles
  ]
}

resource "restapi_object" "subscribeShareNameExceptions" {
  for_each = var.SubscribeShareNameExceptions
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/aclProfiles/${urlencode(each.value.aclProfileName)}/subscribeShareNameExceptions"
  id_attribute = "subscribeShareNameException"
  object_id = urlencode(each.value.subscribeShareNameException)
  force_new = ["subscribeShareNameException","subscribeShareNameExceptionSyntax"]
  destroy_path = "/msgVpns/${urlencode(each.value.msgVpnName)}/aclProfiles/${urlencode(each.value.aclProfileName)}/subscribeShareNameExceptions/${urlencode(each.value.subscribeShareNameExceptionSyntax)},{id}"
  read_path = "/msgVpns/${urlencode(each.value.msgVpnName)}/aclProfiles/${urlencode(each.value.aclProfileName)}/subscribeShareNameExceptions/${urlencode(each.value.subscribeShareNameExceptionSyntax)},{id}"
  data = jsonencode(each.value)

  depends_on = [
    restapi_object.aclProfiles
  ]
}

resource "restapi_object" "clientProfiles" {
  for_each = var.ClientProfiles
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/clientProfiles"
  id_attribute = "clientProfileName"
  object_id = urlencode(each.value.clientProfileName)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.msgVpns
  ]
}

resource "restapi_object" "clientUsernames" {
  for_each = var.ClientUsernames
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
  for_each = var.AuthorizationGroups
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
  for_each = var.Queues
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/queues"
  id_attribute = "queueName"
  object_id = urlencode(each.value.queueName)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.msgVpns
  ]
}

resource "restapi_object" "subscriptions" {
  for_each = var.Subscriptions
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/queues/${urlencode(each.value.queueName)}/subscriptions"
  id_attribute = "subscriptionTopic"
  object_id = urlencode(each.value.subscriptionTopic)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.queues
  ]
}

resource "restapi_object" "bridges" {
  for_each = var.Bridges
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/bridges"
  id_attribute = "bridgeName"
  object_id = urlencode(each.value.bridgeName)
  force_new = ["bridgeVirtualRouter"]
  read_path = "/msgVpns/${urlencode(each.value.msgVpnName)}/bridges/{id},${urlencode(each.value.bridgeVirtualRouter)}"
  update_path = "/msgVpns/${urlencode(each.value.msgVpnName)}/bridges/{id},${urlencode(each.value.bridgeVirtualRouter)}"
  destroy_path = "/msgVpns/${urlencode(each.value.msgVpnName)}/bridges/{id},${urlencode(each.value.bridgeVirtualRouter)}"
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.msgVpns,
  ]
}

resource "restapi_object" "remoteMsgVpns" {
  for_each = var.RemoteMsgVpns
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/bridges/${urlencode(each.value.bridgeName)},${urlencode(each.value.bridgeVirtualRouter)}/remoteMsgVpns"
  id_attribute = "remoteMsgVpnName"
  object_id = urlencode(each.value.remoteMsgVpnName)
  force_new = ["remoteMsgVpnLocation","remoteMsgVpnInterface"]
  read_path = "/msgVpns/${urlencode(each.value.msgVpnName)}/bridges/${urlencode(each.value.bridgeName)},${urlencode(each.value.bridgeVirtualRouter)}/remoteMsgVpns/{id},${urlencode(each.value.remoteMsgVpnLocation)},${urlencode(each.value.remoteMsgVpnInterface)}"
  update_path = "/msgVpns/${urlencode(each.value.msgVpnName)}/bridges/${urlencode(each.value.bridgeName)},${urlencode(each.value.bridgeVirtualRouter)}/remoteMsgVpns/{id},${urlencode(each.value.remoteMsgVpnLocation)},${urlencode(each.value.remoteMsgVpnInterface)}"
  destroy_path = "/msgVpns/${urlencode(each.value.msgVpnName)}/bridges/${urlencode(each.value.bridgeName)},${urlencode(each.value.bridgeVirtualRouter)}/remoteMsgVpns/{id},${urlencode(each.value.remoteMsgVpnLocation)},${urlencode(each.value.remoteMsgVpnInterface)}"
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.bridges
  ]
}

resource "restapi_object" "remoteSubscriptions" {
  for_each = var.RemoteSubscriptions
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/bridges/${urlencode(each.value.bridgeName)},${urlencode(each.value.bridgeVirtualRouter)}/remoteSubscriptions"
  id_attribute = "remoteSubscriptionTopic"
  object_id = urlencode(each.value.remoteSubscriptionTopic)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.bridges
  ]
}

resource "restapi_object" "clientCertAuthorities" {
  for_each = var.ClientCertAuthorities
  path = "/clientCertAuthorities"
  id_attribute = "certAuthorityName"
  object_id = urlencode(each.value.certAuthorityName)
  data = jsonencode(each.value)
}

resource "restapi_object" "ocspTlsTrustedCommonNames" {
  for_each = var.OcspTlsTrustedCommonNames
  path = "/clientCertAuthorities/${urlencode(each.value.certAuthorityName)}/ocspTlsTrustedCommonNames"
  id_attribute = "ocspTlsTrustedCommonNames"
  object_id = urlencode(each.value.ocspTlsTrustedCommonNames)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.clientCertAuthorities
  ]
}

resource "restapi_object" "dmrClusters" {
  for_each = var.DmrClusters
  path = "/dmrClusters"
  id_attribute = "dmrClusterName"
  object_id = urlencode(each.value.dmrClusterName)
  data = jsonencode(each.value)
}

resource "restapi_object" "dmrLinks" {
  for_each = var.DmrLinks
  path = "/dmrClusters/${urlencode(each.value.dmrClusterName)}/links"
  id_attribute = "remoteNodeName"
  object_id = urlencode(each.value.remoteNodeName)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.dmrClusters
  ]
}

resource "restapi_object" "dmrLinkRemoteAddresses" {
  for_each = var.DmrLinkRemoteAddresses
  path = "/dmrClusters/${urlencode(each.value.dmrClusterName)}/links/${urlencode(each.value.remoteNodeName)}/remoteAddresses"
  id_attribute = "remoteAddress"
  object_id = urlencode(each.value.remoteAddress)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.dmrLinks
  ]
}

resource "restapi_object" "domainCertAuthorities" {
  for_each = var.DomainCertAuthorities
  path = "/domainCertAuthorities"
  id_attribute = "certAuthorityName"
  object_id = urlencode(each.value.certAuthorityName)
  data = jsonencode(each.value)
}

resource "restapi_object" "authenticationOauthProviders" {
  for_each = var.AuthenticationOauthProviders
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/authenticationOauthProviders"
  id_attribute = "oauthProviderName"
  object_id = urlencode(each.value.oauthProviderName)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.msgVpns,
  ]
}

resource "restapi_object" "dmrBridges" {
  for_each = var.DmrBridges
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/dmrBridges"
  id_attribute = "remoteNodeName"
  object_id = urlencode(each.value.remoteNodeName)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.msgVpns,
  ]
}

resource "restapi_object" "jndiConnectionFactories" {
  for_each = var.JndiConnectionFactories
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/jndiConnectionFactories"
  id_attribute = "connectionFactoryName"
  object_id = urlencode(each.value.connectionFactoryName)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.msgVpns,
  ]
}

resource "restapi_object" "jndiQueues" {
  for_each = var.JndiQueues
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/jndiQueues"
  id_attribute = "queueName"
  object_id = urlencode(each.value.queueName)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.msgVpns,
  ]
}

resource "restapi_object" "jndiTopics" {
  for_each = var.JndiTopics
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/jndiTopics"
  id_attribute = "topicName"
  object_id = urlencode(each.value.topicName)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.msgVpns,
  ]
}

resource "restapi_object" "mqttSessions" {
  for_each = var.MqttSessions
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/mqttSessions"
  id_attribute = "mqttSessionClientId"
  object_id = urlencode(each.value.mqttSessionClientId)
  force_new = ["mqttSessionVirtualRouter"]
  read_path = "/msgVpns/${urlencode(each.value.msgVpnName)}/mqttSessions/{id},${urlencode(each.value.mqttSessionVirtualRouter)}"
  update_path = "/msgVpns/${urlencode(each.value.msgVpnName)}/mqttSessions/{id},${urlencode(each.value.mqttSessionVirtualRouter)}"
  destroy_path = "/msgVpns/${urlencode(each.value.msgVpnName)}/mqttSessions/{id},${urlencode(each.value.mqttSessionVirtualRouter)}"
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.msgVpns,
  ]
}

resource "restapi_object" "mqttSessionSubscriptions" {
  for_each = var.MqttSessionSubscriptions
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/mqttSessions/{id},${urlencode(each.value.mqttSessionVirtualRouter)}/subscriptions"
  id_attribute = "subscriptionTopic"
  object_id = urlencode(each.value.subscriptionTopic)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.mqttSessions,
  ]
}

resource "restapi_object" "queueTemplates" {
  for_each = var.QueueTemplates
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/queueTemplates"
  id_attribute = "queueTemplateName"
  object_id = urlencode(each.value.queueTemplateName)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.msgVpns
  ]
}

resource "restapi_object" "replayLogs" {
  for_each = var.ReplayLogs
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/replayLogs"
  id_attribute = "replayLogName"
  object_id = urlencode(each.value.replayLogName)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.msgVpns
  ]
}

resource "restapi_object" "replicatedTopics" {
  for_each = var.ReplicatedTopics
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/replicatedTopics"
  id_attribute = "replicatedTopic"
  object_id = urlencode(each.value.replicatedTopic)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.msgVpns
  ]
}

resource "restapi_object" "topicEndpointTemplates" {
  for_each = var.TopicEndpointTemplates
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/topicEndpointTemplates"
  id_attribute = "topicEndpointTemplateName"
  object_id = urlencode(each.value.topicEndpointTemplateName)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.msgVpns
  ]
}

resource "restapi_object" "topicEndpoints" {
  for_each = var.TopicEndpoints
  path = "/msgVpns/${urlencode(each.value.msgVpnName)}/topicEndpoints"
  id_attribute = "topicEndpointName"
  object_id = urlencode(each.value.topicEndpointName)
  data = jsonencode(each.value)
  depends_on = [
    restapi_object.msgVpns
  ]
}

resource "restapi_object" "virtualHostnames" {
  for_each = var.VirtualHostnames
  path = "/virtualHostnames"
  id_attribute = "virtualHostname"
  object_id = urlencode(each.value.virtualHostname)
  data = jsonencode(each.value)
}