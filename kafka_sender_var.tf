variable "KafkaSenders" {
    type = list(object({
        msgVpnName = string
        kafkaSenderName = string
        authenticationBasicPassword = optional(string)
        authenticationBasicUsername = optional(string)
        authenticationClientCertContent = optional(string)
        authenticationClientCertPassword = optional(string)
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
    }))
    default = []
}

variable "KafkaSenderQueueBindings" {
    type = list(object({
        msgVpnName = string	
        kafkaReceiverName = string
        topicName = string
        ackMode = optional(string)
    }))
    default = []
}