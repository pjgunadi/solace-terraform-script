# Terraform Module for Solace Configuration with SEMPv2 API

## Quickstart
1. Create configuration file `terraform.tfvars`. See the sample file [terraform.tfvars_sample](./terraform.tfvars_sample)
2. Run terraform from command line:
   - Initialize: `terraform init`
   - Plan: `terraform plan`
   - Apply / Update resource: `terraform apply [--auto-approve]`
   - Delete resource: `terraform destroy [--auto-approve]`
3. This template can be used as a module

## Description
This template use restapi custom provider from Mastercard. The resources are configured based on the specification of [Solace SEMP v2](https://docs.solace.com/API-Developer-Online-Ref-Documentation/swagger-ui/config/index.html)

## Required Configuration
Solace SEMP API url must be configured in `solace_host` variable. Example:
```
solace_host = {
  uri = "https://yoursolaceurl:port/SEMP/v2/config/"
  insecure = false
  username = "adminuser"
  password = "yourpassword"
  write_returns_object = true
  debug = false
}
```

## Configure Solace PubSub+ Resources
Define Solace resources in variable file; `terraform.tfvars`. Each resource is directly mapped to Solace SEMPv2 API object. The object variable is defined using the following format:
```
<ObjectName> = {
  [ {
    <attribute_name> = <attribute_value>
    ...
  },
  <next_object_key> = {
    <attribute_name> = <attribute_value>
    ...
  },
  ...
  ]
}
```
The list of available objects and its attributes can be found in [variable definition file](./variable.tf)

Below is an example for defining `MsgVpns` object:
```
MsgVpns = {
    myvpn1 = {
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
}
```

## Reference:
- [Solace SEMP v2](https://docs.solace.com/API-Developer-Online-Ref-Documentation/swagger-ui/config/index.html)
- [Terraform restapi provider](https://github.com/Mastercard/terraform-provider-restapi)