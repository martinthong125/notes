# Cloud Formation Best Practices

https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/best-practices.html

The order to setup AWS resources in Cloud Formation (Multi-layer architecture & Service oriented architecture)

1. Identity
2. Base Network
3. Shared Services
4. Backend Services
5. Frontend Services

## Order of AWS resource creation

1. VPC - determines which region resources are created
2. IGW - to allow the VPC to connect to the internet
   - attach to VPC
3. Route table - directs traffic in the VPC
   - Set route
   - For 1 node

CIDR Destination
/28 local
0.0.0.0/0 IGW

For node with peering, add another row.

4. NACL - controls traffic in subnets

   - stateless, configure inbound and outbound rules
   - Use default configuration

5. Subnet

   - public subnet
   - associate with the default NACL
   - high availability? depends on customer's requirement

6. SG - controls traffic in EC2

   - configure allow rules only
   - configure inbound to allow 80, 443 from anywhere
   - default: Deny all inbound, Allow all outbound

7. EC2
   - attached to a custom SG
   - use the latest AMI
   - EBS - use the size that customer subscribe to

EIP for 1 node and ALB for more than 1 node

Security used

1. WAF
2. IP table
3. SG

SAM - Serverless Application Model - build serverless applications in simple and clean syntax in AWS

[AWS Serverless Application Model - Amazon Web Services](https://aws.amazon.com/serverless/sam/)

\*\*\* Never use default resources created by AWS

\*\*\* Create your resources dynamically instead of hard-coding the values whenever possible

\*\*\* ssh CIDR should not be 0.0.0.0/0 for production

\*\*\* Never make changes to your stack without using the template. If not, it will create drift on the stack.

\*\*\* Create access keys only when you need to use it. Do not store any active access keys.

\*\*\* Use creation policy with EC2 and ASG (Auto Scaling Group)

\*\*\* Use update policy with ASG

\*\*\* Use parameters with constraints

\*\*\* Run drift detection before performing stack operations!!!
