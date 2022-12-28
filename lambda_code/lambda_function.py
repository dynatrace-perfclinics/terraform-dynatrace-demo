import json
import time
import random
import json

def lambda_handler(event, context):
    sleep_time = random.random()*random.randint(1,3) 
    print(f'Sleeping {sleep_time} seconds')
    time.sleep(sleep_time)
    response_data = json.dumps(
        {"sleep_time": sleep_time, "animal": "dog"}
    )
    return {
      "statusCode": 200,
      "headers": {
        "Content-Type": "application/json"
      },
      "isBase64Encoded": False,
      "multiValueHeaders": { 
        "X-Custom-Header": ["My value", "My other value"],
      },
      "body": response_data
    }
