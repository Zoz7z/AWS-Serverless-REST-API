import json
import boto3
import os

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table(os.environ['TABLE_NAME'])

def handler(event, context):
    body = json.loads(event.get('body', '{}'))
    
    table.put_item(Item={
        'userId': body['userId'],
        'todoId': body['todoId'],
        'task': body['task']
    })
    
    return {
        "statusCode": 201,
        "headers": {
            "Content-Type": "application/json",
            "Access-Control-Allow-Origin": "*"
        },
        "body": json.dumps({"message": "Task Created Successfully"})
    }