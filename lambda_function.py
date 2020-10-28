import boto3
import csv

def lambda_function(event, context):
    print("welcome to terraform")

# def lambda_handler(event, context):
#     key = 'data.csv'
#     bucket = 'lambda-bucket-python-code'
#     dyndb = boto3.client('dynamodb')
#     s3_resource = boto3.resource('s3')
#     s3_object = s3_resource.Object(bucket, key)
#
#     data = s3_object.get()['Body'].read().decode('utf-8').splitlines()
#     firstrecord = True
#
#     lines = csv.reader(data)
#     headers = next(lines)
#     print('headers: %s' % (headers))
#     # for line in lines:
#     #     #print complete line
#     #     print(line)
#     #     #print index wise
#     #     print(line[0], line[1])
#     for row in lines:
#         if (firstrecord):
#             firstrecord = False
#             continue
#         empid = row[0]
#         firstname = row[1].replace(',', '').replace('$', '') if row[1] else '-'
#         lastname = row[2].replace(',', '').replace('$', '') if row[1] else '-'
#         salary = row[3].replace(',', '').replace('$', '') if row[2] else 0
#         response = dyndb.put_item(
#             TableName='emplist',
#             Item={
#                 'empid': {'N': str(empid)},
#                 'firstname': {'S': firstname},
#                 'lastname': {'S': lastname},
#                 'salary': {'N': str(salary)}
#             }
#         )
#         print('Put succeeded:')