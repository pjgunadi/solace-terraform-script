variable "KafkaSenders" {
    type = list(object({
        msgVpnName = string
        kafkaSenderName = string
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
        batchMaxMsgCount = optional(number)
        batchMaxSize = optional(number)
        bootstrapAddressList = optional(string)
        enabled = optional(bool)
        idempotenceEnabled = optional(bool)
        transportCompressionEnabled = optional(bool)
        transportCompressionLevel = optional(number)
        transportCompressionType = optional(string)
        transportTlsEnabled = optional(bool)
        #Import Flag 
        _import = optional(bool)
    }))
    default = []
}

variable "KafkaSenderQueueBindings" {
    type = list(object({
        msgVpnName = string	
        kafkaSenderName = string
        queueName = string
        ackMode = optional(string)
        enabled = optional(bool)
        partitionConsistentHash = optional(string)
        partitionExplicitNumber = optional(number)
        partitionRandomFallbackEnabled = optional(bool)
        partitionScheme = optional(string)
        remoteKey = optional(string)
        remoteTopic = optional(string)
        #Import Flag 
        _import = optional(bool)
    }))
    default = []
}