resource "aws_waf_ipset" "ipset" {
  count = var.create_waf_acl == true ? 1 : 0

  name = "keyconjurer-${terraform.workspace}-tfIPSet"
  ip_set_descriptors {
    type  = "IPV4"
    value = "127.0.0.1/32"
  }
}

resource "aws_waf_web_acl" "keyconjurer_waf_acl" {
  count = var.create_waf_acl == true ? 1 : 0

  name        = "KeyConjurerWAF${terraform.workspace}WebACL"
  metric_name = "KeyConjurerWAF${terraform.workspace}WebACL"

  default_action {
    type = "BLOCK"
  }
}

