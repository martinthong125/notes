# The Top 10 AWS Services to Learn First

1. Backup
   - Essential components. Eg. Backup vaults, Backup plans, Job
   - create a custom backup plan
1. Cloudformation
   - Essential components. Eg. Stacks
   - create resources from VPC to EC2
   - yaml syntax
1. CloudTrail
   - Essential components. Eg. Event history
   - check who and what resources have been assessed
1. CloudWatch
   - Essential components. Eg. Alarms, Logs, Events
   - search for the logs to debug
1. DynamoDB or any DB
   - Essential components. Eg. Tables
   - query DB
1. EC2
   - Essential components. Eg. Instance Type, AMIs, Volumes, Snapshots, Security Groups, Elastic IPs, Key Pairs, Network Interfaces, Load Balancers, Target Groups, Tags
   - create, start, stop, terminate an EC2 instance
   - termination protection
   - assign a role to the instance
   - take a snapshot and restore a snapshot
1. EventBridge
   - Essential components. Eg. Event buses, Rules, Schedules
   - triggers a lambda function
1. IAM
   - Essential components. Eg. User groups, Users, Roles, Policies
   - assigning minimum permissions to a role to do a job
   - STS and assume role
1. Lambda
   - Essential components. Eg. Applications, Functions
   - python boto3 to interact with AWS APIs
   - how to trigger a lambda function with CloudWatch
   - SAM: Serverless Application Repository to look for sample code
     - Advanced usage of lambda with other services. Eg. Lambda with CloudWatch
1. SES
   - Essential components. Eg. SMTP settings, Verified identities
   - send email through AWS
   - python boto3 to send email
1. S3
   - Essential components. Eg. Buckets
   - write policy to allow others to access your bucket
1. VPC
   - Essential components. Eg. VPC, Subnet, Route table, Internet gateways, Elastic IPs, NAT gateways, Peering connections, Network ACLs, Security groups
   - Networking: CIDR notation, Public IPs range, Private IPs range
   - common ports uses / to open
