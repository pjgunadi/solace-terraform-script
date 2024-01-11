terraform {
  required_providers {
    restapi = {
      source = "Mastercard/restapi"
      version = "1.18.2"
    }
    solacebroker = {
      source = "registry.terraform.io/solaceproducts/solacebroker"
      version = "0.9.1"
    }
  }
}

provider "restapi" {
  uri = var.solace_cloud.uri
  insecure = var.solace_cloud.insecure
  write_returns_object = var.solace_cloud.write_returns_object
  debug = var.solace_cloud.debug
  headers = {
    "Authorization" = "Bearer ${var.solace_cloud.token}"
    "Content-Type" = "application/json"
  }
}

provider "solacebroker" {
  url = var.solace_host.url
  username = var.solace_host.username
  password = var.solace_host.password
  bearer_token = var.solace_host.bearerToken
  insecure_skip_verify = var.solace_host.insecureSkipVerify
  request_min_interval = var.solace_host.requestMinInterval
  request_timeout_duration = var.solace_host.requestTimeoutDuration
  retries = var.solace_host.retries
  retry_max_interval = var.solace_host.retryMaxInterval
  retry_min_interval = var.solace_host.retryMinInterval
  skip_api_check = var.solace_host.skipApiCheck
}

