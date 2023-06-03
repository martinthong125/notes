# Boto3 & AWS Lambda

## Boto3 Essentials:

1. Session

- if running the script on localhost, a default session is launched to login to AWS console. You can create a custom session using profile_name.
- If running the script on Lambda, a default session is launched to login to AWS console. Alternative, you can run the script using a custom Role.
  \*\*\* Best practice, as a multi-account user. Do not use default profile but custom profile to create the session.

2. Resource object - a high level client=class. It is easier to code but the resources that is available is limited.
3. Client object -  a low level client=object. It is harder to code but all resources are available.
4. Meta object - use Resource object to call Client object to access its (Client) methods.
5. Collections - use it to iterate a group of resources by using a for loop to filter for the information you want.
6. Waiters - to pause execution till a certain state is achieved. Always use from Client to increase the wait time for creating and deleting resources. If possible, do not use waiter in lambda as it will increase computation time and hence cost.
7. Paginators - use when you expect api call returns to be more than 50 or 100 results for using client object method.

## Common python modules that work well with boto3

datetime - to display formatted date time.

csv - to work with EXCEL file

json - encoding and decoding json

time - to find elapsed time

sys - exit with error code, output to screen or file

os - get env var,

pprint - to print readable json

## Common scenario after printing the object method:

the output starts with a {, a dictionary. To access the elements in a dictionary, use [ ].

the output starts with a [, a list. To access the elements in a list, use a for loop.

the output says it is an object. To access the elements in the object, use a for loop.

the better method to access a dict obj: dict.get(key) # no errors

## Lambda Essentials:

1. provide a handler - the default function must be there
2. runtime environment - choose your programming language
3. credentials - programmatic access key or IAM Role

## Use CloudWatch to trigger a lambda function

Event aka change in state of resource

Schedule aka cron job

Use SNS for notification

---

## Lambda - Function + nano services

Do one thing

Be more useful than the cost incurred

Async Event Based Triggers

The max time the function will execute is 15 mins

Steps:

1. Create the lambda function
2. Deploy the lambda function
3. Invoke the lambda function

- Console
- AWS CLI
- SDK
- AWS resources events

\*\*\* Use SAM as an alternative to Lambda - simpler and faster code generation
