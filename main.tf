resource "aws_cloudfront_response_headers_policy" "response_headers_policy" {
  name    = local.name
  comment = local.comment

  dynamic "cors_config" {
    for_each = local.create_cors_config ? [1] : []
    content {
      access_control_allow_credentials = var.cors_config["access_control_allow_credentials"]
      access_control_max_age_sec       = var.cors_config["access_control_max_age_sec"]
      origin_override                  = var.cors_config["origin_override"]
      access_control_allow_headers {
        items = var.cors_config["access_control_allow_headers"]
      }
      access_control_allow_methods {
        items = var.cors_config["access_control_allow_methods"]
      }
      access_control_allow_origins {
        items = lookup(var.cors_config, "access_control_allow_origins", null)
      }
      access_control_expose_headers {
        items = lookup(var.cors_config, "access_control_expose_headers", null)
      }
    }
  }

  dynamic "custom_headers_config" {
    for_each = local.create_custom_headers_config ? [1] : []
    content {
      dynamic "items" {
        for_each = var.custom_headers
        content {
          header   = items.value["header"]
          override = items.value["override"]
          value    = items.value["value"]
        }
      }
    }
  }

  dynamic "security_headers_config" {
    for_each = local.create_security_headers_config ? [1] : []
    content {
      dynamic "content_security_policy" {
        for_each = lookup(var.security_headers_config, "content_security_policy", null) != null ? [1] : []
        content {
          content_security_policy = var.security_headers_config["content_security_policy"]["content_security_policy"]
          override                = var.security_headers_config["content_security_policy"]["override"]
        }
      }
      dynamic "content_type_options" {
        for_each = lookup(var.security_headers_config, "content_type_options", null) != null ? [1] : []
        content {
          override = var.security_headers_config["content_type_options"]["override"]
        }
      }
      dynamic "frame_options" {
        for_each = lookup(var.security_headers_config, "frame_options", null) != null ? [1] : []
        content {
          frame_option = var.security_headers_config["frame_options"]["frame_option"]
          override     = var.security_headers_config["frame_options"]["override"]
        }
      }
      dynamic "referrer_policy" {
        for_each = lookup(var.security_headers_config, "referrer_policy", null) != null ? [1] : []
        content {
          referrer_policy = var.security_headers_config["referrer_policy"]["referrer_policy"]
          override        = var.security_headers_config["referrer_policy"]["override"]
        }
      }
      dynamic "strict_transport_security" {
        for_each = lookup(var.security_headers_config, "strict_transport_security", null) != null ? [1] : []
        content {
          access_control_max_age_sec = var.security_headers_config["strict_transport_security"]["access_control_max_age_sec"]
          include_subdomains         = lookup(var.security_headers_config["strict_transport_security"], "include_subdomains", null)
          override                   = var.security_headers_config["strict_transport_security"]["override"]
          preload                    = lookup(var.security_headers_config["strict_transport_security"], "preload", null)
        }
      }
      dynamic "xss_protection" {
        for_each = lookup(var.security_headers_config, "xss_protection", null) != null ? [1] : []
        content {
          mode_block = var.security_headers_config["xss_protection"]["mode_block"]
          override   = var.security_headers_config["xss_protection"]["override"]
          protection = var.security_headers_config["xss_protection"]["protection"]
          report_uri = lookup(var.security_headers_config["xss_protection"], "report_uri", null)
        }
      }
    }
  }
}
