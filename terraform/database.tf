resource "aws_dynamodb_table" "todo_table" {
  name         = "${var.project_name}-table"
  billing_mode = "PAY_PER_REQUEST"

  hash_key  = "userId"
  range_key = "todoId"

  attribute {
    name = "userId"
    type = "S"
  }

  attribute {
    name = "todoId"
    type = "S"
  }

  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"
}