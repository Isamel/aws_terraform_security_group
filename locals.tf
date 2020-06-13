locals {
  tags  = merge(
      map("key", "resource_name", "value", var.security_group_name),
      var.extra_tags
  )
}