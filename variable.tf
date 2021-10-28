variable "solace_host" {
    type = object({
        uri = string
        insecure = bool
        username = string
        password = string
        write_returns_object = bool
        debug = bool
    })
}
variable "MsgVpns" {
    type = map(object({
        msgVpnName =string
        enabled = bool
        authenticationBasicProfileName = string
        authenticationBasicType = string
        authenticationClientCertEnabled = bool
        authorizationProfileName = string
        authorizationType = string
        dmrEnabled = bool
        eventLogTag = string
        maxConnectionCount = number
        maxMsgSpoolUsage = number
        serviceSmfPlainTextEnabled = bool
        serviceSmfTlsEnabled = bool
        tlsAllowDowngradeToPlainTextEnabled = bool
    }))
    default = {}
}
variable "AclProfiles" {
    type = map(object({
        aclProfileName = string
        msgVpnName = string
        clientConnectDefaultAction = string
        publishTopicDefaultAction = string
        subscribeTopicDefaultAction = string
        subscribeShareNameDefaultAction = string
    }))
    default = {}
}
variable "ClientConnectExceptions" {
    type = map(object({
        aclProfileName = string
        clientConnectExceptionAddress = string
        msgVpnName = string
    }))
    default = {}
}
variable "PublishTopicExceptions" {
    type = map(object({
        aclProfileName = string
        msgVpnName = string
        publishTopicException = string
        publishTopicExceptionSyntax = string
    }))
    default = {}
}
variable "SubscribeTopicExceptions" {
    type = map(object({
        aclProfileName = string
        msgVpnName = string
        subscribeTopicException = string
        subscribeTopicExceptionSyntax = string
    }))
    default = {}
}
variable "SubscribeShareNameExceptions" {
    type = map(object({
        aclProfileName = string
        msgVpnName = string
        subscribeShareNameException = string
        subscribeShareNameExceptionSyntax = string
    }))
    default = {}
}
variable "ClientProfiles" {
    type = map(object({
        clientProfileName = string
        msgVpnName = string
        allowBridgeConnectionsEnabled = bool
        allowGuaranteedEndpointCreateDurability = string
        allowGuaranteedEndpointCreateEnabled = bool
        allowGuaranteedMsgReceiveEnabled = bool
        allowGuaranteedMsgSendEnabled = bool
        allowSharedSubscriptionsEnabled = bool
        allowTransactedSessionsEnabled = bool
    }))
    default = {}
}

variable "ClientUsernames" {
    type = map(object({
        clientUsername = string
        msgVpnName = string
        enabled = bool
        aclProfileName = string
        clientProfileName = string
        password = string
        guaranteedEndpointPermissionOverrideEnabled = bool
        subscriptionManagerEnabled = bool
    }))
    default = {}
}

variable "AuthorizationGroups" {
    type = map(object({
        authorizationGroupName = string
        msgVpnName = string
        enabled = bool
        aclProfileName = string
        clientProfileName = string
    }))
    default = {}
}

variable "Queues" {
    type = map(object({
        queueName = string
        msgVpnName = string
        accessType = string
        egressEnabled = bool
        ingressEnabled = bool
        owner = string
        permission = string
    }))
    default = {}
}

variable "Subscriptions" {
    type = map(object({
        subscriptionTopic = string
        queueName = string
        msgVpnName = string
    }))
    default = {}
}

variable "Bridges" {
    type = map(object({
        bridgeName = string
        bridgeVirtualRouter = string
        msgVpnName = string
        enabled = bool
        remoteAuthenticationBasicClientUsername = string
        remoteAuthenticationBasicPassword = string
        remoteAuthenticationScheme = string
    }))
    default = {}
}

variable "RemoteMsgVpns" {
    type = map(object({
        bridgeName = string
        bridgeVirtualRouter = string
        msgVpnName = string
        remoteMsgVpnName = string
        remoteMsgVpnLocation = string
        remoteMsgVpnInterface = string
        enabled = bool
        compressedDataEnabled = bool
        tlsEnabled = bool
        queueBinding = string
    }))
    default = {}
}

variable "RemoteSubscriptions" {
    type = map(object({
        bridgeName = string
        bridgeVirtualRouter = string
        msgVpnName = string
        remoteSubscriptionTopic = string
        deliverAlwaysEnabled = bool
    }))
    default = {}
}

variable "ClientCertAuthorities" {
    type = map(object({
        certAuthorityName = string
        certContent = string
    }))
    default = {}
}

variable "OcspTlsTrustedCommonNames" {
    type = map(object({
        certAuthorityName = string
        ocspTlsTrustedCommonName = string
    }))
    default = {}
}

variable "DmrClusters" {
    type = map(object({
        dmrClusterName = string
        enabled = bool
        authenticationBasicPassword = string
        authenticationClientCertContent = string
        authenticationClientCertPassword = string
    }))
    default = {}
}

variable "DmrLinks" {
    type = map(object({
        dmrClusterName = string
        remoteNodeName = string
        enabled = bool
        authenticationBasicPassword = string
        authenticationScheme = string
        span = string
        transportCompressedEnabled = bool
        transportTlsEnabled = bool
    }))
    default = {}
}

variable "DmrLinkRemoteAddresses" {
    type = map(object({
        dmrClusterName = string
        remoteNodeName = string
        remoteAddress = string
    }))
    default = {}
}

variable "DomainCertAuthorities" {
    type = map(object({
        certAuthorityName = string
        certContent = string
    }))
    default = {}
}

variable "AuthenticationOauthProviders" {
    type = map(object({
        msgVpnName = string
        oauthProviderName = string
        enabled = bool
        audienceClaimName = string
        audienceClaimValue = string
        audienceValidationEnabled = bool
        authorizationGroupClaimName = string
        authorizationGroupClaimSource = string
        authorizationGroupEnabled = bool
        jwksUri = string
        tokenInstropectionUsername = string
        tokenIntrospectionPassword = string
        usernameClaimName = string
        usernameClaimSource = string
        usernameValidateEnabled = bool
    }))
    default = {}
}

variable "DmrBridges" {
    type = map(object({
        msgVpnName = string
        remoteMsgVpnName = string
        remoteNodeName = string
    }))
    default = {}
}

variable "JndiConnectionFactories" {
    type = map(object({
        msgVpnName = string
        connectionFactoryName = string
    }))
    default = {}
}

variable "JndiQueues" {
    type = map(object({
        msgVpnName = string
        queueName = string
        physicalName = string
    }))
    default = {}
}

variable "JndiTopics" {
    type = map(object({
        msgVpnName = string
        topicName = string
        physicalName = string
    }))
    default = {}
}

variable "MqttRetainCaches" {
    type = map(object({
        msgVpnName = string
        cacheName = string
        enabled = bool
        msgLifetime = number
    }))
    default = {}
}

variable "MqttSessions" {
    type = map(object({
        msgVpnName = string
        mqttSessionClientId = string
        mqttSessionVirtualRouter = string
        enabled = bool
        owner = string
    }))
    default = {}
}

variable "MqttSessionSubscriptions" {
    type = map(object({
        msgVpnName = string
        mqttSessionClientId = string
        mqttSessionVirtualRouter = string
        subscriptionTopic = string
        subscriptionQos = number
    }))
    default = {}
}

variable "QueueTemplates" {
    type = map(object({
        msgVpnName = string
        queueTemplateName = string
        accessType = string
        permission = string
        queueNameFilter = string
    }))
    default = {}
}

variable "ReplayLogs" {
    type = map(object({
        msgVpnName = string
        replayLogName = string
        egressEnabled = bool
        ingressEnabled = bool
        maxSpoolUsage = number
    }))
    default = {}
}

variable "ReplicatedTopics" {
    type = map(object({
        msgVpnName = string
        replicatedTopic = string
        replicationMode = string
    }))
    default = {}
}

variable "TopicEndpointTemplates" {
    type = map(object({
        msgVpnName = string
        topicEndpointTemplateName = string
        accessType = string
        permission = string
        topicEndpointNameFilter = string
    }))
    default = {}
}

variable "TopicEndpoints" {
    type = map(object({
        msgVpnName = string
        topicEndpointName = string
        accessType = string
        egressEnabled = bool
        ingressEnabled = bool
        owner = string
        permission = string
    }))
    default = {}
}

variable "VirtualHostnames" {
    type = map(object({
        virtualHostname = string
        enabled = bool
        msgVpnName = string
    }))
    default = {}
}