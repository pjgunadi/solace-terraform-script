resource "solacebroker_msg_vpn_cert_matching_rule" "certMatchingRules" {
    for_each = {
        for v in var.CertMatchingRules : "${v.msgVpnName}.${v.ruleName}" => v
    }

    msg_vpn_name = each.value.msgVpnName
    rule_name = each.value.ruleName
    enabled = each.value.enabled

    depends_on = [
        solacebroker_msg_vpn.msgVpns
    ]
}

resource "solacebroker_msg_vpn_cert_matching_rule_attribute_filter" "certMatchingRuleAttributeFilters" {
    for_each = {
        for v in var.CertMatchingRuleAttributeFilters : "${v.msgVpnName}.${v.ruleName}.${v.filterName}" => v
    }

    msg_vpn_name = each.value.msgVpnName
    rule_name = each.value.ruleName
    filter_name = each.value.filterName
    attribute_name = each.value.attributeName
    attribute_value = each.value.attributeValue

    depends_on = [
        solacebroker_msg_vpn.msgVpns,
        solacebroker_msg_vpn_cert_matching_rule.certMatchingRules
    ]
}

resource "solacebroker_msg_vpn_cert_matching_rule_condition" "certMatchingRuleConditions" {
    for_each = {
        for v in var.CertMatchingRuleConditions : "${v.msgVpnName}.${v.ruleName}.${v.source}" => v
    }

    msg_vpn_name = each.value.msgVpnName
    rule_name = each.value.ruleName
    source = each.value.source
    attribute = each.value.attribute
    expression = each.value.expression

    depends_on = [
        solacebroker_msg_vpn.msgVpns,
        solacebroker_msg_vpn_cert_matching_rule.certMatchingRules
    ]
}

# Import
import {
    for_each = {
        for v in var.CertMatchingRules : "${v.msgVpnName}.${v.ruleName}" => "${urlencode(v.msgVpnName)}/${urlencode(v.ruleName)}" if v._import==true
    }

    to = solacebroker_msg_vpn_cert_matching_rule.certMatchingRules[each.key]
    id = each.value
}

import {
    for_each = {
        for v in var.CertMatchingRuleAttributeFilters : "${v.msgVpnName}.${v.ruleName}.${v.filterName}" => "${urlencode(v.msgVpnName)}/${urlencode(v.ruleName)}/${urlencode(v.filterName)}" if v._import==true
    }

    to = solacebroker_msg_vpn_cert_matching_rule_attribute_filter.certMatchingRuleAttributeFilters[each.key]
    id = each.value
}

import {
    for_each = {
        for v in var.CertMatchingRuleConditions : "${v.msgVpnName}.${v.ruleName}.${v.source}" => "${urlencode(v.msgVpnName)}/${urlencode(v.ruleName)}/${urlencode(v.source)}" if v._import==true
    }

    to = solacebroker_msg_vpn_cert_matching_rule_condition.certMatchingRuleConditions[each.key]
    id = each.value
}
