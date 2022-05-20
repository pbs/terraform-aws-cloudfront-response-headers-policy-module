module "response_headers_policy" {
  source = "../.."

  cors_config = {
    access_control_allow_credentials = true
    access_control_allow_headers     = ["test"]
    access_control_allow_methods     = ["GET"]
    access_control_allow_origins     = ["test.example.comtest"]
    access_control_expose_headers    = ["test"]
    access_control_max_age_sec       = 3600
    origin_override                  = true
  }

  custom_headers = [
    {
      header   = "header"
      override = false
      value    = "value"
    },
    {
      header   = "header2"
      override = true
      value    = "value2"
    }
  ]

  security_headers_config = {
    content_security_policy = {
      content_security_policy = "default-src 'self'"
      override                = true
    }
    content_type_options = {
      override = true
    }
    frame_options = {
      frame_option = "SAMEORIGIN"
      override     = true
    }
    referrer_policy = {
      referrer_policy = "no-referrer-when-downgrade"
      override        = true
    }
    strict_transport_security = {
      access_control_max_age_sec = 3600
      include_subdomains         = true
      override                   = true
      preload                    = true
    }
    xss_protection = {
      mode_block = true
      override   = true
      protection = true
    }
  }

  product = var.product
}
