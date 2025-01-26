# Terraform

output "registration_token" {
  value = nonsensitive(data.rancher2_cluster_v2.rke2_cluster.cluster_registration_token[0])
}
