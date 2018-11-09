output "id" {
  value = "${join("", aws_elasticache_replication_group.default.*.id)}"
}

output "primary_endpoint_address" {
  value = "${aws_elasticache_replication_group.default.primary_endpoint_address}"
}

output "security_group_id" {
  value = "${join("", aws_security_group.default.*.id)}"
}

output "port" {
  value = "${var.port}"
}

output "host" {
  value = "${module.dns.hostname}"
}
