module "response_headers_policy" {
  source = "../.."

  cors_config = {
    access_control_allow_credentials = true
    access_control_allow_headers     = ["test"]
    access_control_allow_methods     = ["GET"]
    access_control_allow_origins     = ["test.example.comtest"]
    access_control_max_age_sec       = 3600
    origin_override                  = true
  }

  product = var.product
}
