resource "aws_dynamodb_table" "todo_table" {

  name         = "${var.project_name}-table"
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "taskId"

  attribute {
    name = "taskId"
    type = "S"
  }

  tags = {
    Name = "${var.project_name}-db"
  }
}