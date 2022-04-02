locals {
  oracle_linux_8_5_image_ocid = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaalipbcpelzws3vnyobw5o2oci4oc66yqgsrh652awpuuiqkruwfaq" # https://docs.oracle.com/en-us/iaas/images/image/17fdec28-66b3-4169-9e7d-125f57e58c74/
  shape                       = "VM.Standard.A1.Flex"
  memory                      = 24
  ocpus                       = 4
  volume_size                 = 200
}

data "oci_identity_availability_domains" "ads" {
  compartment_id = var.tenancy_ocid
}

resource "oci_core_instance" "arm_instance" {
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  compartment_id      = var.compartment_ocid
  shape               = local.shape
  shape_config {
    memory_in_gbs = local.memory
    ocpus         = local.ocpus
  }
  source_details {
    source_id               = local.oracle_linux_8_5_image_ocid
    source_type             = "image"
    boot_volume_size_in_gbs = local.volume_size
  }

  # Optional
  display_name = "arm-instance"
  create_vnic_details {
    assign_public_ip = true
    subnet_id        = oci_core_subnet.subnet.id
  }
  metadata = {
    ssh_authorized_keys = var.public_key
  }
  preserve_boot_volume = false
}
