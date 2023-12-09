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
  cloudflare_ips = [
    "173.245.48.0/20",
    "103.21.244.0/22",
    "103.22.200.0/22",
    "103.31.4.0/22",
    "141.101.64.0/18",
    "108.162.192.0/18",
    "190.93.240.0/20",
    "188.114.96.0/20",
    "197.234.240.0/22",
    "198.41.128.0/17",
    "162.158.0.0/15",
    "104.16.0.0/13",
    "104.24.0.0/14",
    "172.64.0.0/13",
    "131.0.72.0/22"
  ]
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
    udp_options {
      min = local.openvpn_port
      max = local.openvpn_port
    }

    protocol = local.udp_protocol
    source   = var.cluster_ip
  }

  ingress_security_rules {
    udp_options {
      min = local.wireguard_port
      max = local.wireguard_port
    }

    protocol = local.udp_protocol
    source   = var.cluster_ip
  }

  dynamic "ingress_security_rules" {
    for_each = local.cloudflare_ips

    content {
      tcp_options {
        min = local.http_port
        max = local.http_port
      }

      protocol = local.tcp_protocol
      source   = ingress_security_rules.value
    }
  }
}
