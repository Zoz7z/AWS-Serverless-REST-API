resource "aws_lambda_function" "crud_lambda" {

  function_name = "${var.project_name}-crud"

  role    = var.lab_role_arn
  runtime = "python3.9"

  handler = "index.handler"

  filename = "../lambda/crud_package.zip"

  environment {
    variables = {
      TABLE_NAME = aws_dynamodb_table.todo_table.name
    }
  }
}