output "table_name" {

  value = aws_dynamodb_table.todo_table.name
}

output "user_pool_id" {

  value = aws_cognito_user_pool.user_pool.id
}

output "lambda_name" {

  value = aws_lambda_function.crud_lambda.function_name
}

output "api_id" {

  value = aws_api_gateway_rest_api.api.id
}