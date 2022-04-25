provider "aws" {
  region = var.region
}

resource "aws_config_configuration_recorder" "recorder" {
  name     = var.name
  role_arn = "arn:aws:iam::${var.organization}:role/aws-service-role/config.amazonaws.com/AWSServiceRoleForConfig"

  recording_group {
    all_supported                 = "true"
    include_global_resource_types = "true"
  }
}

resource "aws_config_delivery_channel" "config" {
  name           = aws_config_configuration_recorder.recorder.name
  s3_bucket_name = var.bucket

  snapshot_delivery_properties {
    delivery_frequency = var.frequency
  }

  depends_on = [
    aws_config_configuration_recorder.recorder
  ]
}

resource "aws_config_configuration_recorder_status" "status" {
  name       = aws_config_configuration_recorder.recorder.name
  is_enabled = true
  depends_on = [aws_config_delivery_channel.config]
}