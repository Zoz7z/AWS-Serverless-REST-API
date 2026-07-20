resource "aws_cloudfront_distribution" "cdn" {

  enabled = true

  origin {
    domain_name = "example.execute-api.us-east-1.amazonaws.com"

    origin_id = "api"
  }

  default_cache_behavior {

    target_origin_id = "api"

    viewer_protocol_policy = "redirect-to-https"

    allowed_methods = [
      "GET",
      "HEAD",
      "OPTIONS",
      "PUT",
      "POST",
      "PATCH",
      "DELETE"
    ]

    cached_methods = [
      "GET",
      "HEAD"
    ]
  }

  restrictions {

    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}