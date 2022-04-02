locals {
  tcp_protocol       = "6"
  anywhere           = "0.0.0.0/0"
  ssh_port           = "22"
  http_port          = "80"
  https_port         = "443"
  security_list_name = "security-list"
}

resource "oci_core_security_list" "security_list" {
  compartment_id = var.compartment_ocid
  display_name   = local.security_list_name
  vcn_id         = oci_core_vcn.vcn.id

  egress_security_rules {
    protocol    = local.tcp_protocol
    destination = local.anywhere
  }

  ingress_security_rules {
    tcp_options {
      min = local.ssh_port
      max = local.ssh_port
    }

    protocol = local.tcp_protocol
    source   = local.anywhere
  }

  ingress_security_rules {
    tcp_options {
      min = local.http_port
      max = local.http_port
    }

    protocol = local.tcp_protocol
    source   = local.anywhere
  }

  ingress_security_rules {
    tcp_options {
      min = local.http_port
      max = local.http_port
    }

    protocol = local.tcp_protocol
    source   = local.anywhere
  }
}
