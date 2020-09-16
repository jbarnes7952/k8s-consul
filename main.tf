variable "workers" {
	default = 3
	description = "The number of k8s worker nodes to build"
}

variable "primary_config" {
	default = <<EOF
---
dashboard: false
servers:
- name: k8s-master
  type: master
  box: ubuntu/xenial64
  box_version: 20180831.0.0
  eth1: 192.168.205.10
  mem: 2048
  cpu: 2
EOF
}

locals {
	config = [
		for n in range(var.workers) : templatefile("${path.module}/templates/config.tmpl", {
			ip_address = format("192.168.205.%s", n+11)
			name       = format("k8s-worker-%s", n+1)
		})
	]
}

resource "local_file" "config" {
	content = join("",[var.primary_config],local.config)
	filename = "${path.module}/k8s-cluster/configuration.yaml"
}

resource "null_resource" "invoke_vagrant" {
	depends_on = [local_file.config,]
	provisioner "local-exec" {
    command = "cd ./k8s-cluster && vagrant up"
  }
  provisioner "local-exec" {
    when    = destroy
    command = "cd ./k8s-cluster && vagrant destroy -f"
  }
}
