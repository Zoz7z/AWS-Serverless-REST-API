resource "aws_cloudwatch_log_group" "lambda_logs" {
  name              = "/aws/lambda/${var.project_name}-crud"
  retention_in_days = 7
}

resource "aws_xray_group" "xray" {
  group_name        = var.project_name
  filter_expression = "service(\"${var.project_name}\")"
}