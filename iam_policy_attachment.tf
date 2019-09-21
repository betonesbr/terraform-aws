
resource "aws_iam_user" "user-projeto" {
  name = "user-projeto"
  tags = "${local.tags}"
}

resource "aws_iam_access_key" "key-projeto" {
  user    = "${aws_iam_user.user-projeto.name}"
  
}

resource "aws_iam_policy" "policy-projeto" {
  name        = "policy-projeto"
  description = "Policy BI-projeto"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "VisualEditor0",
      "Effect": "Allow",
      "Action": "s3:*",
      "Resource": [
        "arn:aws:s3:::datalake-brm-env/*",
        "arn:aws:s3:::datalake-cmm-env/*",
        "arn:aws:s3:::datalake-gsp-env/*",
        "arn:aws:s3:::datalake-performance-env/*",
        "arn:aws:s3:::datalake-agreements-env/*",
        "arn:aws:s3:::datalake-caduni-env/*",
        "arn:aws:s3:::datalake-super-env/*",
        "arn:aws:s3:::datalake-digitalstore-env/*",
        "arn:aws:s3:::datalake-brm-env",
        "arn:aws:s3:::datalake-cmm-env",
        "arn:aws:s3:::datalake-gsp-env",
        "arn:aws:s3:::datalake-performance-env",
        "arn:aws:s3:::datalake-agreements-env",
        "arn:aws:s3:::datalake-caduni-env",
        "arn:aws:s3:::datalake-super-env",
        "arn:aws:s3:::datalake-digitalstore-env"
      ]
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "projeto-attach" {
  name       = "projeto-attach"
  users      = ["${aws_iam_user.user-projeto.name}"]
  policy_arn = "${aws_iam_policy.policy-projeto.arn}"
}
