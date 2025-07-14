variable "KafkaReceivers" {
    type = list(object({
        msgVpnName = string	
        kafkaReceiverName = string
        authenticationAwsMskIamAccessKeyId = optional(string)
        authenticationAwsMskIamRegion = optional(string)
        authenticationAwsMskIamSecretAccessKey = optional(string)
        authenticationAwsMskIamStsExternalId = optional(string)
        authenticationAwsMskIamStsRoleArn = optional(string)
        authenticationAwsMskIamStsRoleSessionName = optional(string)
        authenticationBasicPassword = optional(string)	
        authenticationBasicUsername = optional(string)	
        authenticationClientCertContent = optional(string)	
        authenticationClientCertPassword = optional(string)
        authenticationKerberosKeytabContent = optional(string)
        authenticationKerberosKeytabFileName = optional(string)
        authenticationKerberosServiceName = optional(string)
        authenticationKerberosUserPrincipalName = optional(string)
        authenticationOauthClientId = optional(string)	
        authenticationOauthClientScope = optional(string)	
        authenticationOauthClientSecret = optional(string)	
        authenticationOauthClientTokenEndpoint = optional(string)
        authenticationScheme = optional(string)	
        authenticationScramHash = optional(string)	
        authenticationScramPassword = optional(string)	
        authenticationScramUsername = optional(string)	
        batchDelay = optional(number)	
        batchMaxSize = optional(number)	
        bootstrapAddressList = optional(string)	
        enabled = optional(bool)	
        groupId = optional(string)	
        groupKeepaliveInterval = optional(number)	
        groupKeepaliveTimeout = optional(number)	
        groupMembershipType = optional(string)	
        groupPartitionSchemeList = optional(string)	
        metadataTopicExcludeList = optional(string)	
        metadataTopicRefreshInterval = optional(number)	
        transportTlsEnabled = optional(bool)
        #Import Flag 
        _import = optional(bool)
    }))
    default = []
}

variable "KafkaReceiverTopicBindings" {
    type = list(object({
        msgVpnName = string	
        kafkaReceiverName = string
        topicName = string
        enabled = optional(bool)
        initialOffset = optional(string)
        localKey = optional(string)
        localTopic = optional(string)
        #Import Flag 
        _import = optional(bool)
    }))
    default = []
}