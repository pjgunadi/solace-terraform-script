# Collection of Terraform scripts for Solace Configuration

## Quickstart
1. Create configuration file e.g. `your_solace_config.tfvars`. See the sample file [terraform.tfvars_sample](./terraform.tfvars_sample)
2. Create a new workspace or select existing workspace (if required):
`terraform workspace new {your_workspace_name}` or `terraform wokspace select {your_workspace_name}`
3. Run terraform from command line:
   - Initialize: `terraform init`
   - Plan: `terraform -chdir=[appliance|software] plan  -var-file=../relative/path/from/appliance/or/software/to/yours_solace_config.tfvars`
   - Apply / Update resource: `terraform -chdir=[appliance|software] apply -var-file=../relative/path/from/appliance/or/software/to/yours_solace_config.tfvars [-auto-approve]`
   - Delete resource: `terraform -chdir=[appliance|software] destroy -var-file=../relative/path/from/appliance/or/software/to/yours_solace_config.tfvars [-auto-approve]`
4. This template can be used as a module

## Description
This repository provides a collection of terraform scripts for configuring Solace broker.

## Required Configuration
1. Solace SEMP API url must be configured in `solace_host` variable. 
2. Add credential properties with either username and password or bearerToken
Sample of `solace_host` with `username` and `password`:
```
solace_host = {
  url = "https://yoursolaceurl:port"
  username = "adminuser"
  password = "yourpassword"
}
```
Sample of `solace_host` with `bearerToken`:
```
solace_host = {
  url = "https://yoursolaceurl:port"
  username = null
  password = null
  bearerToken = "yourbase64bearertoken"
}
```

## Configure Solace Resources
Define Solace resources in variable file; `terraform.tfvars`. Each resource is directly mapped to Solace SEMPv2 API object. The object variable is defined using the following format:
```
<ObjectName> = [
  {
    <attribute_name> = <attribute_value>
    ...
  },
  {
    <attribute_name> = <attribute_value>
    ...
  },
  ...
]
```
The list of available objects and its attributes can be found in `*_var.tf` files

Below is an example for defining `MsgVpns` object:
```
MsgVpns = [
    {
        msgVpnName ="myvpn1"
        enabled = true
        authenticationBasicProfileName = ""
        authenticationBasicType = "internal"
        authenticationClientCertEnabled = false
        authorizationProfileName = ""
        authorizationType = "internal"
        dmrEnabled = false
        eventLogTag = ""
        maxConnectionCount = 100
        maxMsgSpoolUsage = 100
        serviceSmfPlainTextEnabled = true
        serviceSmfTlsEnabled = false
        tlsAllowDowngradeToPlainTextEnabled = false
    }
]
```

## Import Existing Resource into Terraform State
Existing configuration can be added into Terraform state by adding attribute `_import = true` in object variable. Example:
```
MsgVpns = [
    {
        msgVpnName ="myvpn2"
        enabled = true
        maxConnectionCount = 1000
        _import = true
    }
]
```

## Configure ClientProfiles in older version of Solace Cloud Service
1. Set variable `is_old_cloud_service` to `true`
2. Assign Solace cloud URL, ServiceId, and token in `solace_cloud` variable:
```
solace_cloud = {
  uri = "https://api.solace.cloud/api/v2/missionControl/eventBrokerServices/"
  insecure = false
  write_returns_object = true
  debug = true
  service_id = your_service_id
  token = your_api_token
}
```
3. Define client profile details in `CloudClientProfiles` variable:
```
CloudClientProfiles = [
  {
    name = "your_new_client_profile"
    allowGuaranteedEndpointCreateEnabled = true
    allowGuaranteedMsgReceiveEnabled = true
    allowGuaranteedMsgSendEnabled = true
    allowSharedSubscriptionsEnabled = false
    allowTransactedSessionsEnabled = false
  }
]
```

## Reference:
- [Solace provider for Terraform](https://registry.terraform.io/providers/SolaceProducts/solacebroker/latest/docs)
- [Solace Cloud ClientProfiles API](https://api.solace.dev/cloud/reference/getclientprofile)
- [Restapi provider for Terraform](https://github.com/Mastercard/terraform-provider-restapi)