# PBS TF CloudFront Response Headers Policy Module

## Installation

### Using the Repo Source

Use this URL for the source of the module. See the usage examples below for more details.

```hcl
github.com/pbs/terraform-aws-cloudfront-response-headers-policy-module?ref=x.y.z
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

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.15.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudfront_response_headers_policy.response_headers_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_response_headers_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_product"></a> [product](#input\_product) | Tag used to group resources according to product | `string` | n/a | yes |
| <a name="input_comment"></a> [comment](#input\_comment) | A comment to describe the response headers policy. The comment cannot be longer than 128 characters. | `string` | `null` | no |
| <a name="input_cors_config"></a> [cors\_config](#input\_cors\_config) | CORS configuration | `any` | `null` | no |
| <a name="input_custom_headers"></a> [custom\_headers](#input\_custom\_headers) | Custom headers | <pre>list(object({<br>    header   = string<br>    override = bool<br>    value    = string<br>  }))</pre> | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the Cloudfront response headers policy module. If null, will default to product. | `string` | `null` | no |
| <a name="input_security_headers_config"></a> [security\_headers\_config](#input\_security\_headers\_config) | A configuration for a set of security-related HTTP response headers | `map(any)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | ID for the CloudFront Response Headers Policy |
| <a name="output_name"></a> [name](#output\_name) | Name for the CloudFront Response Headers Policy |
