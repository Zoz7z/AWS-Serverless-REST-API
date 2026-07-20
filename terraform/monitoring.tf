resource "aws_cloudwatch_log_group" "lambda_logs" {

  name = "/aws/lambda/serverless-rest-api"
}

resource "aws_xray_group" "xray" {

  group_name = "serverless-rest-api"
}