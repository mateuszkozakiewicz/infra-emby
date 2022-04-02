locals {
  vcn_name    = "vcn"
  subnet_name = "subnet"
  cidr_subnet = "10.0.0.0/24"
  cidr_vpn    = "10.0.0.0/16"

}

resource "oci_core_subnet" "subnet" {
  #Required
  cidr_block     = local.cidr_subnet
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id

  #Optional
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  display_name        = local.subnet_name
  dns_label           = local.subnet_name
  security_list_ids   = [oci_core_security_list.security_list.id]
}

resource "oci_core_vcn" "vcn" {
  #Required
  compartment_id = var.compartment_ocid

  #Optional
  cidr_blocks  = [local.cidr_vpn]
  display_name = local.vcn_name
  dns_label    = local.vcn_name
}

