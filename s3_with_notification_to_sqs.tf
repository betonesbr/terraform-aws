
####SQS and Queue Policy
resource "aws_sqs_queue" "datalake-brm-environment" {
  name = "datalake-brm-environment"
  delay_seconds             = 0
  max_message_size          = 262144
  message_retention_seconds = 1209600
  receive_wait_time_seconds = 0
  tags = "${local.tags}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "sqs:SendMessage",
      "Resource": "arn:aws:sqs:*:*:datalake-brm-environment",
      "Condition": {
        "ArnEquals": { "aws:SourceArn": "${aws_s3_bucket.datalake-brm-environment.arn}" }
      }
    }
  ]
}
POLICY
}

resource "aws_sqs_queue" "datalake-cmm-environment" {
  name = "datalake-cmm-environment"
  delay_seconds             = 0
  max_message_size          = 262144
  message_retention_seconds = 1209600
  receive_wait_time_seconds = 0
  tags = "${local.tags}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "sqs:SendMessage",
      "Resource": "arn:aws:sqs:*:*:datalake-cmm-environment",
      "Condition": {
        "ArnEquals": { "aws:SourceArn": "${aws_s3_bucket.datalake-cmm-environment.arn}" }
      }
    }
  ]
}
POLICY
}


resource "aws_sqs_queue" "datalake-gsp-environment" {
  name = "datalake-gsp-environment"
  delay_seconds             = 0
  max_message_size          = 262144
  message_retention_seconds = 1209600
  receive_wait_time_seconds = 0
  tags = "${local.tags}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "sqs:SendMessage",
      "Resource": "arn:aws:sqs:*:*:datalake-gsp-environment",
      "Condition": {
        "ArnEquals": { "aws:SourceArn": "${aws_s3_bucket.datalake-gsp-environment.arn}" }
      }
    }
  ]
}
POLICY
}


resource "aws_sqs_queue" "datalake-performance-environment" {
  name = "datalake-performance-environment"
  delay_seconds             = 0
  max_message_size          = 262144
  message_retention_seconds = 1209600
  receive_wait_time_seconds = 0
  tags = "${local.tags}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "sqs:SendMessage",
      "Resource": "arn:aws:sqs:*:*:datalake-performance-environment",
      "Condition": {
        "ArnEquals": { "aws:SourceArn": "${aws_s3_bucket.datalake-performance-environment.arn}" }
      }
    }
  ]
}
POLICY
}


resource "aws_sqs_queue" "datalake-digitalstore-environment" {
  name = "datalake-digitalstore-environment"
  delay_seconds             = 0
  max_message_size          = 262144
  message_retention_seconds = 1209600
  receive_wait_time_seconds = 0
  tags = "${local.tags}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "sqs:SendMessage",
      "Resource": "arn:aws:sqs:*:*:datalake-digitalstore-environment",
      "Condition": {
        "ArnEquals": { "aws:SourceArn": "${aws_s3_bucket.datalake-digitalstore-environment.arn}" }
      }
    }
  ]
}
POLICY
}

resource "aws_sqs_queue" "datalake-super-environment" {
  name = "datalake-super-environment"
  delay_seconds             = 0
  max_message_size          = 262144
  message_retention_seconds = 1209600
  receive_wait_time_seconds = 0
  tags = "${local.tags}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "sqs:SendMessage",
      "Resource": "arn:aws:sqs:*:*:datalake-super-environment",
      "Condition": {
        "ArnEquals": { "aws:SourceArn": "${aws_s3_bucket.datalake-super-environment.arn}" }
      }
    }
  ]
}
POLICY
}


resource "aws_sqs_queue" "datalake-agreements-environment" {
  name = "datalake-agreements-environment"
  delay_seconds             = 0
  max_message_size          = 262144
  message_retention_seconds = 1209600
  receive_wait_time_seconds = 0
  tags = "${local.tags}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "sqs:SendMessage",
      "Resource": "arn:aws:sqs:*:*:datalake-agreements-environment",
      "Condition": {
        "ArnEquals": { "aws:SourceArn": "${aws_s3_bucket.datalake-agreements-environment.arn}" }
      }
    }
  ]
}
POLICY
}

resource "aws_sqs_queue" "datalake-caduni-environment" {
  name = "datalake-caduni-environment"
  delay_seconds             = 0
  max_message_size          = 262144
  message_retention_seconds = 1209600
  receive_wait_time_seconds = 0
  tags = "${local.tags}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "sqs:SendMessage",
      "Resource": "arn:aws:sqs:*:*:datalake-caduni-environment",
      "Condition": {
        "ArnEquals": { "aws:SourceArn": "${aws_s3_bucket.datalake-caduni-environment.arn}" }
      }
    }
  ]
}
POLICY
}



####S3 and Notification to SQS
resource "aws_s3_bucket" "datalake-brm-environment" {
  bucket = "datalake-brm-environment"
  force_destroy = "true"
  tags = "${local.tags}"
}

resource "aws_s3_bucket_notification" "bucket_notification-brm" {
  bucket = "${aws_s3_bucket.datalake-brm-environment.id}"

  queue {
    queue_arn     = "${aws_sqs_queue.datalake-brm-environment.arn}"
    events        = ["s3:ObjectCreated:*"]
  }
}


resource "aws_s3_bucket" "datalake-cmm-environment" {
  bucket = "datalake-cmm-environment"
  force_destroy = "true"
  tags = "${local.tags}"
}

resource "aws_s3_bucket_notification" "bucket_notification-cmm" {
  bucket = "${aws_s3_bucket.datalake-cmm-environment.id}"

  queue {
    queue_arn     = "${aws_sqs_queue.datalake-cmm-environment.arn}"
    events        = ["s3:ObjectCreated:*"]
  }
}


resource "aws_s3_bucket" "datalake-gsp-environment" {
  bucket = "datalake-gsp-environment"
  force_destroy = "true"
  tags = "${local.tags}"
}

resource "aws_s3_bucket_notification" "bucket_notification-gsp" {
  bucket = "${aws_s3_bucket.datalake-gsp-environment.id}"

  queue {
    queue_arn     = "${aws_sqs_queue.datalake-gsp-environment.arn}"
    events        = ["s3:ObjectCreated:*"]
  }
}


resource "aws_s3_bucket" "datalake-performance-environment" {
  bucket = "datalake-performance-environment"
  force_destroy = "true"
  tags = "${local.tags}"
}

resource "aws_s3_bucket_notification" "bucket_notification-performance" {
  bucket = "${aws_s3_bucket.datalake-performance-environment.id}"

  queue {
    queue_arn     = "${aws_sqs_queue.datalake-performance-environment.arn}"
    events        = ["s3:ObjectCreated:*"]
  }
}


resource "aws_s3_bucket" "datalake-digitalstore-environment" {
  bucket = "datalake-digitalstore-environment"
  force_destroy = "true"
  tags = "${local.tags}"
}

resource "aws_s3_bucket_notification" "bucket_notification-digitalstore" {
  bucket = "${aws_s3_bucket.datalake-digitalstore-environment.id}"

  queue {
    queue_arn     = "${aws_sqs_queue.datalake-digitalstore-environment.arn}"
    events        = ["s3:ObjectCreated:*"]
  }
}

resource "aws_s3_bucket" "datalake-super-environment" {
  bucket = "datalake-super-environment"
  force_destroy = "true"
  tags = "${local.tags}"
}

resource "aws_s3_bucket_notification" "bucket_notification-super" {
  bucket = "${aws_s3_bucket.datalake-super-environment.id}"

  queue {
    queue_arn     = "${aws_sqs_queue.datalake-super-environment.arn}"
    events        = ["s3:ObjectCreated:*"]
  }
}


resource "aws_s3_bucket" "datalake-agreements-environment" {
  bucket = "datalake-agreements-environment"
  force_destroy = "true"
  tags = "${local.tags}"
}

resource "aws_s3_bucket_notification" "bucket_notification-agreements" {
  bucket = "${aws_s3_bucket.datalake-agreements-environment.id}"

  queue {
    queue_arn     = "${aws_sqs_queue.datalake-agreements-environment.arn}"
    events        = ["s3:ObjectCreated:*"]
  }
}


resource "aws_s3_bucket" "datalake-caduni-environment" {
  bucket = "datalake-caduni-environment"
  force_destroy = "true"
  tags = "${local.tags}"
}

resource "aws_s3_bucket_notification" "bucket_notification-caduni" {
  bucket = "${aws_s3_bucket.datalake-caduni-environment.id}"

  queue {
    queue_arn     = "${aws_sqs_queue.datalake-caduni-environment.arn}"
    events        = ["s3:ObjectCreated:*"]
  }
}