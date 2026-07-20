import json
import boto3
import os

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table(os.environ['TABLE_NAME'])

def handler(event, context):
    path_params = event.get('pathParameters') or {}
    query_params = event.get('queryStringParameters') or {}
    
    todo_id = path_params.get('id')
    user_id = query_params.get('userId')
    
    table.delete_item(
        Key={
            'userId': user_id,
            'todoId': todo_id
        }
    )
    
    return {
        "statusCode": 200,
        "headers": {
            "Content-Type": "application/json",
            "Access-Control-Allow-Origin": "*"
        },
        "body": json.dumps({"message": "Task Deleted Successfully"})
    }