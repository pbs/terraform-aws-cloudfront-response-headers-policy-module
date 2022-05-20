variable "product" {
  description = "Tag used to group resources according to product"
  type        = string
  validation {
    condition     = can(regex("[a-z\\-]+", var.product))
    error_message = "The product variable violates approved regex."
  }
}
