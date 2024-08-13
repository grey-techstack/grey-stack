data "aws_route53_zone" "cloudnoot_com" {
  name = var.dns_zone_name
}

resource "aws_route53_record" "self_IP" {
  zone_id = data.aws_route53_zone.cloudnoot_com.zone_id
  name    = "" #can be wwww or subdomain
  type    = "A"
  ttl     = 300
  records = ["1.1.1.1"] #warning need to be string
}

resource "aws_route53_record" "trojan" {
  zone_id = data.aws_route53_zone.cloudnoot_com.zone_id
  name    = "t" #can be wwww or subdomain
  type    = "A"
  ttl     = 300
  records = ["8.8.8.8"] #warning need to be string
}

resource "aws_route53_record" "trojan_challenge" {
  zone_id = data.aws_route53_zone.cloudnoot_com.zone_id
  name    = "_acme-challenge.t.sample.com." #can be wwww or subdomain, this new one is from certbot
  type    = "TXT"
  ttl     = 300
  records = ["LQgjORaQASBsQjZnZ60Bjvk-8krEo30UfTBaSXmvg"]
}

resource "aws_route53_record" "certbot-TXT-0730" {
  zone_id = data.aws_route53_zone.cloudnoot_com.zone_id
  name    = "_acme-challenge.sample.com." #can be wwww or subdomain, this new one is from certbot
  type    = "TXT"
  ttl     = 300
  records = ["ZpaVJMumQxAy9nTFzRbpY5EkImGlmOFKRO-D4uEzo"]
}