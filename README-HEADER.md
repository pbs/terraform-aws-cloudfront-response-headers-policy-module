# PBS TF cloudfront response headers policy module

## Installation

### Using the Repo Source

```hcl
module "cloudfront-response-headers-policy" {
    source = "github.com/pbs/terraform-aws-cloudfront-response-headers-policy-module?ref=x.y.z"
}
```

### Alternative Installation Methods

More information can be found on these install methods and more in [the documentation here](./docs/general/install).

## Usage

This module provisions a Cloudfront response headers policy. At least one of `cors_configuration`, `custom_headers`, and `security_headers_config` must be populated.

Integrate this module like so:

```hcl
module "cloudfront-response-headers-policy" {
  source = "github.com/pbs/terraform-aws-cloudfront-response-headers-policy-module?ref=x.y.z"

  # Optional Parameters
  # cors_config = {
  #   access_control_allow_credentials = true
  #   access_control_allow_headers     = ["test"]
  #   access_control_allow_methods     = ["GET"]
  #   access_control_allow_origins     = ["test.example.comtest"]
  #   access_control_expose_headers    = ["test"]
  #   access_control_max_age_sec       = 3600
  #   origin_override                  = true
  # }
  # custom_headers = [
  #   {
  #     header   = "header"
  #     override = false
  #     value    = "value"
  #   },
  #   {
  #     header   = "header2"
  #     override = true
  #     value    = "value2"
  #   }
  # ]
  # security_headers_config = {
  #   content_security_policy = {
  #     content_security_policy = "default-src 'self'"
  #     override                = true
  #   }
  #   content_type_options = {
  #     override = true
  #   }
  #   frame_options = {
  #     frame_option = "SAMEORIGIN"
  #     override     = true
  #   }
  #   referrer_policy = {
  #     referrer_policy = "no-referrer-when-downgrade"
  #     override        = true
  #   }
  #   strict_transport_security = {
  #     access_control_max_age_sec = 3600
  #     include_subdomains         = true
  #     override                   = true
  #     preload                    = true
  #   }
  #   xss_protection = {
  #     mode_block = true
  #     override   = true
  #     protection = true
  #   }
  # }

  # Tagging Parameters
  product = var.product

  # Optional Parameters
}
```

## Adding This Version of the Module

If this repo is added as a subtree, then the version of the module should be close to the version shown here:

`x.y.z`

Note, however that subtrees can be altered as desired within repositories.

Further documentation on usage can be found [here](./docs).

Below is automatically generated documentation on this Terraform module using [terraform-docs][terraform-docs]

---

[terraform-docs]: https://github.com/terraform-docs/terraform-docs
