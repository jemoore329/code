from __future__ import print_function # Python 2/3 compatibility
import boto3
import json
import decimal

dynamodb = boto3.resource('dynamodb', region_name='us-west-2', endpoint_url="http://localhost:8000")

table = dynamodb.Table('Affinity')

with open("43.json") as json_file:
    shoppers = json.load(json_file, parse_float = decimal.Decimal)
    for shopper in shoppers:
        shopper_id = int(shopper['shopper_id'])
        affinity = shopper['affinity']

        print("Adding shopper:", shopper_id, affinity)

        table.put_item(
           Item={
               'shopper_id': shopper_id,
               'affinity': affinity,
            }
        )
