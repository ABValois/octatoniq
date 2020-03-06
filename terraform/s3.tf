
###############################################################################
# Bucket we serve the frontend from
resource "aws_s3_bucket" "site_frontend_bucket" {
    bucket        = "${local.site_name}-frontend-${data.aws_caller_identity.current.account_id}"
    acl           = "private"
    force_destroy = true

    server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
                sse_algorithm = "AES256"
            }
        }
    }
                       
    tags = {
        Project        = local.site_name
        Creator        = "Terraform"
        Stack_Position = "Frontend"
    }
}

###############################################################################
# IAM Policy for the frontend bucket
data "aws_iam_policy_document" "site_frontend_bucket_policy" {
    statement {
        sid       = "DenyInsecureCommunications"
        effect    = "Deny"
        resources = ["${aws_s3_bucket.site_frontend_bucket.arn}/*"]
        actions   = ["s3:*"]

        condition {
            test     = "Bool"
            variable = "aws:SecureTransport"
            values   = ["false"]
        }

        principals {
            type        = "*"
            identifiers = ["*"]
        }
    }

    statement {
        sid       = "CloudfrontGetObjects"
        actions   = ["s3:GetObject"]
        resources = ["${aws_s3_bucket.site_frontend_bucket.arn}/*"]

        principals {
            type        = "AWS"
            identifiers = ["${aws_cloudfront_origin_access_identity.site_frontend_origin_access_identity.iam_arn}"]
        }
    }

    statement {
        sid       = "CloudFrontFindBucket"
        actions   = ["s3:ListBucket"]
        resources = ["${aws_s3_bucket.site_frontend_bucket.arn}"]

        principals {
            type        = "AWS"
            identifiers = ["${aws_cloudfront_origin_access_identity.site_frontend_origin_access_identity.iam_arn}"]
        }
    }
}

###############################################################################
# Attach policy to bucket (need to do separate to prevent a cycle)
resource "aws_s3_bucket_policy" "site_frontend_policy_attachment" {
    bucket     = aws_s3_bucket.site_frontend_bucket.id
    policy     = data.aws_iam_policy_document.site_frontend_bucket_policy.json
    depends_on = [aws_cloudfront_origin_access_identity.site_frontend_origin_access_identity]
}
