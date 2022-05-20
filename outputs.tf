output "id" {
  description = "ID for the CloudFront Response Headers Policy"
  value       = aws_cloudfront_response_headers_policy.response_headers_policy.id
}

output "name" {
  description = "Name for the CloudFront Response Headers Policy"
  value       = aws_cloudfront_response_headers_policy.response_headers_policy.name
}
