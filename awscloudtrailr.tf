resource "aws_cloudtrail" "btsaudit-cloudtrail" {
  name                          = "cloudtrail-general-rule"
  s3_bucket_name                = "${var.cloudtrail_s3_bucket_name}"
  include_global_service_events = true
  is_multi_region_trail = true
}