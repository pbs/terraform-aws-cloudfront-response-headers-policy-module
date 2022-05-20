locals {
  name    = var.name != null ? var.name : var.product
  comment = var.comment != null ? var.comment : "Custom response headers policy for ${local.name}"

  create_cors_config             = var.cors_config != null
  create_custom_headers_config   = var.custom_headers != null
  create_security_headers_config = var.security_headers_config != null
}
