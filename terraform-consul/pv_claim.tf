resource "kubernetes_persistent_volume_claim" "consul-server-0" {
	  depends_on = [kubernetes_persistent_volume.consul-server-0,]
    wait_until_bound = true

    metadata {
        name             = "data-default-consul-cluster-consul-server-0"
        namespace        = "default"
    }

    spec {
        access_modes       = [
            "ReadWriteOnce",
        ]
        storage_class_name = "manual"
        volume_name        = "consul-server-0"

        resources {
            limits   = {}
            requests = {
                "storage" = "10Gi"
            }
        }
    }

    timeouts {}
}

resource "kubernetes_persistent_volume_claim" "consul-server-1" {
	  depends_on = [kubernetes_persistent_volume.consul-server-1,]
    wait_until_bound = true

    metadata {
        name             = "data-default-consul-cluster-consul-server-1"
        namespace        = "default"
    }

    spec {
        access_modes       = [
            "ReadWriteOnce",
        ]
        storage_class_name = "manual"
        volume_name        = "consul-server-1"

        resources {
            limits   = {}
            requests = {
                "storage" = "10Gi"
            }
        }
    }

    timeouts {}
}

resource "kubernetes_persistent_volume_claim" "consul-server-2" {
	  depends_on = [kubernetes_persistent_volume.consul-server-2,]
    wait_until_bound = true

    metadata {
        name             = "data-default-consul-cluster-consul-server-2"
        namespace        = "default"
    }

    spec {
        access_modes       = [
            "ReadWriteOnce",
        ]
        storage_class_name = "manual"
        volume_name        = "consul-server-2"

        resources {
            limits   = {}
            requests = {
                "storage" = "10Gi"
            }
        }
    }

    timeouts {}
}
