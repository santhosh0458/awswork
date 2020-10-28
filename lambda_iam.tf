//resource "aws_iam_role_policy" "lambda_policy" {
//  name = "lambda_policy"
//  role = "${aws_iam_role.lambda_role.id}"
//
//  policy ="${file("\lambda_policy.json")}"
//}
//
//resource "aws_iam_role" "lambda_role" {
//  name = "lambda_role"
//
//  assume_role_policy = "${file("\lambda_assume_role_policy.json")}"
//
//}

resource "aws_iam_role_policy" "lambda_policy" {
  name = "lambda_policy"
  role = aws_iam_role.lambda_role.id

  policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": [
          "ec2:*",
          "s3:*",
          "dynamodb:*",
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        "Effect": "Allow",
        "Resource": "*"
      }
    ]
  }
  EOF
}

resource "aws_iam_role" "lambda_role" {
  name = "lambda_role"

  assume_role_policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Principal": {
          "Service": [
              "s3.amazonaws.com",
              "dynamodb.amazonaws.com"]
        },
        "Effect": "Allow",
        "Sid": ""
      }
    ]
  }
  EOF
}