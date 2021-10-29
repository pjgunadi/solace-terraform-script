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
    type = list(object({
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
    default = []
}
variable "AclProfiles" {
    type = list(object({
        aclProfileName = string
        msgVpnName = string
        clientConnectDefaultAction = string
        publishTopicDefaultAction = string
        subscribeTopicDefaultAction = string
        subscribeShareNameDefaultAction = string
    }))
    default = []
}
variable "ClientConnectExceptions" {
    type = list(object({
        aclProfileName = string
        clientConnectExceptionAddress = string
        msgVpnName = string
    }))
    default = []
}
variable "PublishTopicExceptions" {
    type = list(object({
        aclProfileName = string
        msgVpnName = string
        publishTopicException = string
        publishTopicExceptionSyntax = string
    }))
    default = []
}
variable "SubscribeTopicExceptions" {
    type = list(object({
        aclProfileName = string
        msgVpnName = string
        subscribeTopicException = string
        subscribeTopicExceptionSyntax = string
    }))
    default = []
}
variable "SubscribeShareNameExceptions" {
    type = list(object({
        aclProfileName = string
        msgVpnName = string
        subscribeShareNameException = string
        subscribeShareNameExceptionSyntax = string
    }))
    default = []
}
variable "ClientProfiles" {
    type = list(object({
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
    default = []
}

variable "ClientUsernames" {
    type = list(object({
        clientUsername = string
        msgVpnName = string
        enabled = bool
        aclProfileName = string
        clientProfileName = string
        password = string
        guaranteedEndpointPermissionOverrideEnabled = bool
        subscriptionManagerEnabled = bool
    }))
    default = []
}

variable "AuthorizationGroups" {
    type = list(object({
        authorizationGroupName = string
        msgVpnName = string
        enabled = bool
        aclProfileName = string
        clientProfileName = string
    }))
    default = []
}

variable "Queues" {
    type = list(object({
        queueName = string
        msgVpnName = string
        accessType = string
        egressEnabled = bool
        ingressEnabled = bool
        owner = string
        permission = string
    }))
    default = []
}

variable "Subscriptions" {
    type = list(object({
        subscriptionTopic = string
        queueName = string
        msgVpnName = string
    }))
    default = []
}

variable "Bridges" {
    type = list(object({
        bridgeName = string
        bridgeVirtualRouter = string
        msgVpnName = string
        enabled = bool
        remoteAuthenticationBasicClientUsername = string
        remoteAuthenticationBasicPassword = string
        remoteAuthenticationScheme = string
    }))
    default = []
}

variable "RemoteMsgVpns" {
    type = list(object({
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
    default = []
}

variable "RemoteSubscriptions" {
    type = list(object({
        bridgeName = string
        bridgeVirtualRouter = string
        msgVpnName = string
        remoteSubscriptionTopic = string
        deliverAlwaysEnabled = bool
    }))
    default = []
}

variable "ClientCertAuthorities" {
    type = list(object({
        certAuthorityName = string
        certContent = string
    }))
    default = []
}

variable "OcspTlsTrustedCommonNames" {
    type = list(object({
        certAuthorityName = string
        ocspTlsTrustedCommonName = string
    }))
    default = []
}

variable "DmrClusters" {
    type = list(object({
        dmrClusterName = string
        enabled = bool
        authenticationBasicPassword = string
        authenticationClientCertContent = string
        authenticationClientCertPassword = string
    }))
    default = []
}

variable "DmrLinks" {
    type = list(object({
        dmrClusterName = string
        remoteNodeName = string
        enabled = bool
        authenticationBasicPassword = string
        authenticationScheme = string
        span = string
        transportCompressedEnabled = bool
        transportTlsEnabled = bool
    }))
    default = []
}

variable "DmrLinkRemoteAddresses" {
    type = list(object({
        dmrClusterName = string
        remoteNodeName = string
        remoteAddress = string
    }))
    default = []
}

variable "DomainCertAuthorities" {
    type = list(object({
        certAuthorityName = string
        certContent = string
    }))
    default = []
}

variable "AuthenticationOauthProviders" {
    type = list(object({
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
    default = []
}

variable "DmrBridges" {
    type = list(object({
        msgVpnName = string
        remoteMsgVpnName = string
        remoteNodeName = string
    }))
    default = []
}

variable "JndiConnectionFactories" {
    type = list(object({
        msgVpnName = string
        connectionFactoryName = string
    }))
    default = []
}

variable "JndiQueues" {
    type = list(object({
        msgVpnName = string
        queueName = string
        physicalName = string
    }))
    default = []
}

variable "JndiTopics" {
    type = list(object({
        msgVpnName = string
        topicName = string
        physicalName = string
    }))
    default = []
}

variable "MqttSessions" {
    type = list(object({
        msgVpnName = string
        mqttSessionClientId = string
        mqttSessionVirtualRouter = string
        enabled = bool
        owner = string
    }))
    default = []
}

variable "MqttSessionSubscriptions" {
    type = list(object({
        msgVpnName = string
        mqttSessionClientId = string
        mqttSessionVirtualRouter = string
        subscriptionTopic = string
        subscriptionQos = number
    }))
    default = []
}

variable "QueueTemplates" {
    type = list(object({
        msgVpnName = string
        queueTemplateName = string
        accessType = string
        permission = string
        queueNameFilter = string
    }))
    default = []
}

variable "ReplayLogs" {
    type = list(object({
        msgVpnName = string
        replayLogName = string
        egressEnabled = bool
        ingressEnabled = bool
        maxSpoolUsage = number
    }))
    default = []
}

variable "ReplicatedTopics" {
    type = list(object({
        msgVpnName = string
        replicatedTopic = string
        replicationMode = string
    }))
    default = []
}

variable "TopicEndpointTemplates" {
    type = list(object({
        msgVpnName = string
        topicEndpointTemplateName = string
        accessType = string
        permission = string
        topicEndpointNameFilter = string
    }))
    default = []
}

variable "TopicEndpoints" {
    type = list(object({
        msgVpnName = string
        topicEndpointName = string
        accessType = string
        egressEnabled = bool
        ingressEnabled = bool
        owner = string
        permission = string
    }))
    default = []
}

variable "VirtualHostnames" {
    type = list(object({
        virtualHostname = string
        enabled = bool
        msgVpnName = string
    }))
    default = []
}