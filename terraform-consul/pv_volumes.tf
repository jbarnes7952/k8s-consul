resource "kubernetes_persistent_volume" "consul-server-0" {
    metadata {
        labels           = {
            "type" = "local"
        }
        name             = "consul-server-0"
    }

    spec {
        access_modes                     = [
            "ReadWriteOnce",
        ]
        capacity                         = {
            "storage" = "100Gi"
        }
        mount_options                    = []
        persistent_volume_reclaim_policy = "Delete"
        storage_class_name               = "manual"
        volume_mode                      = "Filesystem"

        node_affinity {
            required {
                node_selector_term {
                    match_expressions {
                        key      = "kubernetes.io/hostname"
                        operator = "In"
                        values   = [
                            "k8s-worker-1",
                        ]
                    }
                }
            }
        }

        persistent_volume_source {

            host_path {
                path = "/mnt/data"
            }
        }
    }
}

resource "kubernetes_persistent_volume" "consul-server-1" {
    metadata {
        labels           = {
            "type" = "local"
        }
        name             = "consul-server-1"
    }

    spec {
        access_modes                     = [
            "ReadWriteOnce",
        ]
        capacity                         = {
            "storage" = "100Gi"
        }
        mount_options                    = []
        persistent_volume_reclaim_policy = "Delete"
        storage_class_name               = "manual"
        volume_mode                      = "Filesystem"

        node_affinity {
            required {
                node_selector_term {
                    match_expressions {
                        key      = "kubernetes.io/hostname"
                        operator = "In"
                        values   = [
                            "k8s-worker-2",
                        ]
                    }
                }
            }
        }

        persistent_volume_source {

            host_path {
                path = "/mnt/data"
            }
        }
    }
}

resource "kubernetes_persistent_volume" "consul-server-2" {
    metadata {
        labels           = {
            "type" = "local"
        }
        name             = "consul-server-2"
    }

    spec {
        access_modes                     = [
            "ReadWriteOnce",
        ]
        capacity                         = {
            "storage" = "100Gi"
        }
        mount_options                    = []
        persistent_volume_reclaim_policy = "Delete"
        storage_class_name               = "manual"
        volume_mode                      = "Filesystem"

        node_affinity {
            required {
                node_selector_term {
                    match_expressions {
                        key      = "kubernetes.io/hostname"
                        operator = "In"
                        values   = [
                            "k8s-worker-3",
                        ]
                    }
                }
            }
        }

        persistent_volume_source {

            host_path {
                path = "/mnt/data"
            }
        }
    }
}
