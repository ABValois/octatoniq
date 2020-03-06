
###############################################################################
# Origin Access Identity so distribution can access bucket
resource "aws_cloudfront_origin_access_identity" "site_frontend_origin_access_identity" {
    comment = "Let the distribution read the bucket files."
}

###############################################################################
# Cloudfront distribution for our site
resource "aws_cloudfront_distribution" "site_frontend_distribution" {
    enabled             = true
    default_root_object = "index.html"
    is_ipv6_enabled     = false
    aliases = ["${local.site_name}.com", "www.${local.site_name}.com"]

    origin {
        domain_name = aws_s3_bucket.site_frontend_bucket.bucket_regional_domain_name
        origin_id   = "${data.aws_caller_identity.current.account_id}-${local.site_name}"

        s3_origin_config {
            origin_access_identity = aws_cloudfront_origin_access_identity.site_frontend_origin_access_identity.cloudfront_access_identity_path
        }
    }

    default_cache_behavior {
        allowed_methods  = ["GET", "HEAD"]
        cached_methods   = ["GET", "HEAD"]
        target_origin_id = "${data.aws_caller_identity.current.account_id}-${local.site_name}"

        forwarded_values {
            query_string = false

            cookies {
                forward = "none"
            }
        }

        viewer_protocol_policy = "redirect-to-https"
        min_ttl                = 0
        default_ttl            = 3600
        max_ttl                = 86400
    }

    viewer_certificate {
        acm_certificate_arn = aws_acm_certificate_validation.cert_validation.certificate_arn
        ssl_support_method  = "sni-only"
    }

    price_class = "PriceClass_100"
    restrictions {
        geo_restriction {
            restriction_type = "whitelist"
            locations        = ["US", "CA"]
        }
    }

    # custom_error_response {
    #     error_code         = 404
    #     response_code      = 200
    #     response_page_path = "/index.html"
    # }

    tags = {
        Project        = "${local.site_name}"
        Creator        = "Terraform"
        Stack_Position = "Frontend"
    }

    depends_on = [aws_s3_bucket_policy.site_frontend_policy_attachment]
}
