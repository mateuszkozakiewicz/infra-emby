locals {
  tcp_protocol       = "6"
  udp_protocol       = "17"
  anywhere           = "0.0.0.0/0"
  ssh_port           = "22"
  http_port          = "80"
  https_port         = "443"
  openvpn_port       = "1194"
  wireguard_port     = "1195"
  postgres_port      = "5432"
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
    source   = var.cluster_ip
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
      min = local.https_port
      max = local.https_port
    }

    protocol = local.tcp_protocol
    source   = local.anywhere
  }

  ingress_security_rules {
    tcp_options {
      min = local.postgres_port
      max = local.postgres_port
    }

    protocol = local.tcp_protocol
    source   = var.cluster_ip
  }

  ingress_security_rules {
    udp_options  {
      min = local.openvpn_port
      max = local.openvpn_port
    }

    protocol = local.udp_protocol
    source   = var.cluster_ip
  }

  ingress_security_rules {
    udp_options  {
      min = local.wireguard_port
      max = local.wireguard_port
    }

    protocol = local.udp_protocol
    source   = var.cluster_ip
  }
}
