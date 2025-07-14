terraform {
  required_providers {
    solacebroker = {
      source = "registry.terraform.io/solaceproducts/solacebrokerappliance"
      version = "1.2.0"
    }
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

