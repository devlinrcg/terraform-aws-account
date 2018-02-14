resource "aws_config_delivery_channel" "btsaudit-config" {
  name           = "btsaudit-channel"
  s3_bucket_name = "${var.config_s3_bucket_name}"
  depends_on     = ["aws_config_configuration_recorder.btsaudit-config"]
}

resource "aws_config_configuration_recorder" "btsaudit-config" {
  name     = "config-recorder"
  role_arn = "${aws_iam_role.r.arn}"
  recording_group {
      all_supported = true
      include_global_resource_types = true
  }
}

resource "aws_config_configuration_recorder_status" "btsaudit-config" {
  name       = "${aws_config_configuration_recorder.btsaudit-config.name}"
  is_enabled = true
  depends_on = ["aws_config_delivery_channel.btsaudit-config"]
}

resource "aws_iam_role" "r" {
  name = "config-role"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "config.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy" "p" {
  name = "config-policy"
  role = "${aws_iam_role.r.id}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
        "Action": "config:*",
        "Effect": "Allow",
        "Resource": "*"

    }
  ]
}
POLICY
}