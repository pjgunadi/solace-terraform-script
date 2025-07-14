variable "AclProfiles" {
    type = list(object({
        aclProfileName = string
        msgVpnName = string
        clientConnectDefaultAction = optional(string)
        publishTopicDefaultAction = optional(string)
        subscribeTopicDefaultAction = optional(string)
        subscribeShareNameDefaultAction = optional(string)
        #Import Flag 
        _import = optional(bool)
    }))
    default = []
}
variable "ClientConnectExceptions" {
    type = list(object({
        aclProfileName = string
        clientConnectExceptionAddress = string
        msgVpnName = string
        #Import Flag 
        _import = optional(bool)
    }))
    default = []
}

variable "PublishTopicExceptions" {
    type = list(object({
        aclProfileName = string
        msgVpnName = string
        publishTopicException = string
        publishTopicExceptionSyntax = string
        #Import Flag 
        _import = optional(bool)
    }))
    default = []
}

variable "SubscribeTopicExceptions" {
    type = list(object({
        aclProfileName = string
        msgVpnName = string
        subscribeTopicException = string
        subscribeTopicExceptionSyntax = string
        #Import Flag 
        _import = optional(bool)
    }))
    default = []
}

variable "SubscribeShareNameExceptions" {
    type = list(object({
        aclProfileName = string
        msgVpnName = string
        subscribeShareNameException = string
        subscribeShareNameExceptionSyntax = string
        #Import Flag 
        _import = optional(bool)
    }))
    default = []
}
