# ---------------------------------------------------------------------------------------------------------------------
# ENVIRONMENT OUTPUTS
# Series of outputs for your formation
# ---------------------------------------------------------------------------------------------------------------------

output "vpc_cidr" {
  value = "${aws_vpc.Main.cidr_block}"
}
output "public_subnet_cidr" {
  value = "${aws_subnet.Subnet_Public.cidr_block}"
}
output "private_subnet_cidr" {
  value = "${aws_subnet.Subnet_Private.cidr_block}"
}
output "config_enabled" {
  value = "${aws_config_configuration_recorder_status.btsaudit-config.is_enabled}"
}