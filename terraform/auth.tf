resource "aws_cognito_user_pool" "user_pool" {

  name = "${var.project_name}-user-pool"

  password_policy {
    minimum_length = 8
  }
}

resource "aws_cognito_user_pool_client" "client" {

  name         = "${var.project_name}-client"

  user_pool_id = aws_cognito_user_pool.user_pool.id
}