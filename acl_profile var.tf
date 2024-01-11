variable "AclProfiles" {
    type = list(object({
        aclProfileName = string
        msgVpnName = string
        clientConnectDefaultAction = optional(string)
        publishTopicDefaultAction = optional(string)
        subscribeTopicDefaultAction = optional(string)
        subscribeShareNameDefaultAction = optional(string)
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
