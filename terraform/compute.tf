data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = path.module
  output_path = "${path.module}/crud_package.zip"
  excludes    = [
    "*.tf",
    "*.tfvars",
    "*.tfstate*",
    ".terraform",
    ".terraform.lock.hcl",
    "crud_package.zip"
  ]
}

resource "aws_lambda_function" "crud_lambda" {
  function_name = "${var.project_name}-crud"

  role     = var.lab_role_arn
  runtime  = "python3.9"
  handler  = "index.handler"

  filename         = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256

  environment {
    variables = {
      TABLE_NAME = aws_dynamodb_table.todo_table.name
    }
  }
}