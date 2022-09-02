output "instance_public_ip" {
  value = oci_core_instance.arm_instance.public_ip
}

output "vault_ocid" {
  value = oci_kms_vault.emby_vault.id
}
