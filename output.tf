output "server_id"{
  value = "${sakuracloud_server.server.id}"
}
output "disk_id"{
  value = "${sakuracloud_disk.disk.id}"
}
output "global_ip" {
  value = "${sakuracloud_server.server.base_nw_ipaddress}"
}
output "private_ip"{
  value = "${var.private_ip}"
}
output "ssh_command" {
  value = "${format("ssh root@%s -i %s" , sakuracloud_server.server.base_nw_ipaddress , var.ssh_keyfile)}"
}
