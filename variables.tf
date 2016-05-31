/*****************
 * Variables
 *****************/
variable "ssh_keyfile"{ default = "~/.ssh/id_rsa" }
variable "ssh_keyid" {}
variable "zone" { default = "is1a" }
variable "switch_ids" { default = "" }
variable "packet_filter_ids" { default = "" }
variable "private_ip" { default = "" }
variable "server_name" {default = "centos72_server"}
variable "disk_name" {default = "centos72_disk"}
variable "archive_name" {default = "CentOS 7.2 64bit"}
variable "disk_size" { default = "20"}
variable "core" { default = "1" }
variable "memory" { default = "1" }
