output "instance_public_ip" {
  value = oci_core_instance.arm_instance.public_ip
}

output "vault_ocid" {
  value = oci_kms_vault.emby_vault.id
}

output "public_id" {
  value = oci_core_public_ip.public.ip_address
}

output "bucket_access_key" {
  value = oci_identity_customer_secret_key.bucket_identity_secret_key.id
}

output "bucket_secret_key" {
  value     = oci_identity_customer_secret_key.bucket_identity_secret_key.key
  sensitive = true
}

output "bucket_s3_endpoint" {
  value = "https://${data.oci_objectstorage_namespace.emby.namespace}.compat.objectstorage.${var.region}.oraclecloud.com"
}
