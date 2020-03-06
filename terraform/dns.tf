
data "aws_route53_zone" "site_dns" {
    name         = "${local.site_name}.com."
    private_zone = false
}

resource "aws_acm_certificate" "site_cert" {
    domain_name               = "${local.site_name}.com"
    subject_alternative_names = ["www.${local.site_name}.com"]
    validation_method         = "DNS"

    tags = {
        Project        = "${local.site_name}"
        Creator        = "Terraform"
        Stack_Position = "Frontend"
    }
}

resource "aws_route53_record" "cert_validation_record_1" {
    name    = aws_acm_certificate.site_cert.domain_validation_options.0.resource_record_name
    type    = aws_acm_certificate.site_cert.domain_validation_options.0.resource_record_type
    zone_id = data.aws_route53_zone.site_dns.id
    records = ["${aws_acm_certificate.site_cert.domain_validation_options.0.resource_record_value}"]
    ttl     = 60
}

resource "aws_route53_record" "cert_validation_record_2" {
    name    = aws_acm_certificate.site_cert.domain_validation_options.1.resource_record_name
    type    = aws_acm_certificate.site_cert.domain_validation_options.1.resource_record_type
    zone_id = data.aws_route53_zone.site_dns.id
    records = ["${aws_acm_certificate.site_cert.domain_validation_options.1.resource_record_value}"]
    ttl     = 60
}

resource "aws_acm_certificate_validation" "cert_validation" {
    certificate_arn = aws_acm_certificate.site_cert.arn

    validation_record_fqdns = [
        "${aws_route53_record.cert_validation_record_1.fqdn}",
        "${aws_route53_record.cert_validation_record_2.fqdn}"
    ]
}

resource "aws_route53_record" "site_no_www" {
  zone_id = data.aws_route53_zone.site_dns.id
  name    = "${local.site_name}.com"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.site_frontend_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.site_frontend_distribution.hosted_zone_id 
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "site_with_www" {
  zone_id = data.aws_route53_zone.site_dns.id
  name    = "www.${local.site_name}.com"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.site_frontend_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.site_frontend_distribution.hosted_zone_id 
    evaluate_target_health = false
  }
}
