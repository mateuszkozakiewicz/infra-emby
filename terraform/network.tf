locals {
  vcn_name                 = "vcn"
  subnet_name              = "subnet"
  internet_gateway_name    = "internet_gateway"
  cidr_subnet              = "10.0.0.0/24"
  cidr_vpn                 = "10.0.0.0/16"
  internet_gateway_enabled = true
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

resource "oci_core_internet_gateway" "internet_gateway" {
  #Required
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id

  #Optional
  enabled      = local.internet_gateway_enabled
  display_name = local.internet_gateway_name
}

resource "oci_core_route_table" "route_table" {
  #Required
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id

  route_rules {
    #Required
    network_entity_id = oci_core_internet_gateway.internet_gateway.id

    #Optional
    destination      = local.anywhere
    destination_type = "CIDR_BLOCK"
  }
}

resource "oci_core_route_table_attachment" "route_table_attachment" {
  #Required    
  subnet_id = oci_core_subnet.subnet.id
  route_table_id =oci_core_route_table.route_table.id
}
