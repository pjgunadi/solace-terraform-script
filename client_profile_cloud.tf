resource "restapi_object" "clientProfiles" {
  for_each = var.is_old_cloud_service ? {
    for v in var.CloudClientProfiles : "${var.solace_cloud.service_id}.${v.name}" => v
  } : {}
  path = "/${var.solace_cloud.service_id}/clientProfiles"
  id_attribute = "name"
  object_id = urlencode(each.value.name)
  data = jsonencode(each.value)

}