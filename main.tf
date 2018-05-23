resource "aws_acm_certificate" "this" {
  provider = "aws"
  domain_name = "${var.domain}"
  subject_alternative_names = ["${var.alternative_domains}"]
  validation_method = "DNS"
  tags = "${var.tags}"
}

resource "aws_route53_record" "this" {
  count = "${length(var.zone_ids)}"
  name = "${lookup(aws_acm_certificate.this.domain_validation_options[count.index], "resource_record_name")}"
  type = "${lookup(aws_acm_certificate.this.domain_validation_options[count.index], "resource_record_type")}"
  zone_id = "${element(var.zone_ids, count.index)}"
  records = ["${lookup(aws_acm_certificate.this.domain_validation_options[count.index], "resource_record_value")}"]
  ttl = 60
}

resource "aws_acm_certificate_validation" "this" {
  provider = "aws"
  count = "${length(var.zone_ids)}"
  certificate_arn = "${aws_acm_certificate.this.arn}"
  validation_record_fqdns = ["${element(aws_route53_record.this.*.fqdn, count.index)}"]
}
