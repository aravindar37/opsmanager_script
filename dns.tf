data "aws_route53_zone" "selected" {
  name         = var.dns-domain
  private_zone = false
}

resource "aws_route53_record" "om-node-public-dns-record" {
  for_each = aws_instance.om-node
  zone_id  = data.aws_route53_zone.selected.zone_id
  name     = "arex${each.value.tags.Name}.${substr(var.dns-domain, 0, length(var.dns-domain))}"
  type     = "A"
  ttl      = 300
  records  = [each.value.public_ip]
}

resource "aws_route53_record" "om-node-private-dns-record" {
  for_each = aws_instance.om-node
  zone_id  = data.aws_route53_zone.selected.zone_id
  name     = "ar${each.value.tags.Name}.${substr(var.dns-domain, 0, length(var.dns-domain))}"
  type     = "A"
  ttl      = 300
  records  = [each.value.private_ip]
}


resource "aws_route53_record" "lb-node-public-dns-record" {
  zone_id  = data.aws_route53_zone.selected.zone_id
  name     = "arex${aws_instance.lb-node.tags.Name}.${substr(var.dns-domain, 0, length(var.dns-domain))}"
  type     = "A"
  ttl      = 300
  records  = [aws_instance.lb-node.public_ip]
}

resource "aws_route53_record" "lb-node-private-dns-record" {
  zone_id  = data.aws_route53_zone.selected.zone_id
  name     = "ar${aws_instance.lb-node.tags.Name}.${substr(var.dns-domain, 0, length(var.dns-domain))}"
  type     = "A"
  ttl      = 300
  records  = [aws_instance.lb-node.private_ip]
}
