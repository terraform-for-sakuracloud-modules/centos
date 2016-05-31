/*****************
 * Disk
 *****************/
resource "sakuracloud_disk" "disk" {
  name = "${var.disk_name}"
  source_archive_name = "${var.archive_name}"
  ssh_key_ids = ["${var.ssh_keyid}"]
  size = "${var.disk_size}"
  disable_pw_auth = true
  zone = "${var.zone}"
}

/*****************
 * Server
 *****************/
resource "sakuracloud_server" "server" {
  name = "${var.server_name}"
  disks = ["${sakuracloud_disk.disk.id}"]
  additional_interfaces = [ "${compact(split("," , var.switch_ids))}" ]
  packet_filter_ids = [ "${compact(split("," , var.packet_filter_ids))}" ]
  tags = ["@virtio-net-pci"]
  core = "${var.core}"
  memory = "${var.memory}"
  zone = "${var.zone}"

  connection {
    user = "root"
    host = "${self.base_nw_ipaddress}"
    private_key = "${file("${var.ssh_keyfile}")}"
  }
  
  provisioner "file" {
    source = "${path.module}/provision/set_private_ip.sh"
    destination = "/tmp/set_private_ip.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/set_private_ip.sh",
      "/tmp/set_private_ip.sh \"${var.private_ip}\""
    ]
  }
}
