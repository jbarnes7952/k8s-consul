resource "helm_release" "consul" {
	  depends_on = [kubernetes_persistent_volume_claim.consul-server-0,kubernetes_persistent_volume_claim.consul-server-1,kubernetes_persistent_volume_claim.consul-server-2]
    chart                      = "consul"
    name                       = "consul-cluster"
		repository = "https://helm.releases.hashicorp.com"
}
