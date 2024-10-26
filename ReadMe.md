Building AWS infrasturcture using Terraform and utilizing CICD via Github Actions to deploy a dockerized Flask app within an ec2 instance.

THINGS DONE SO FAR:
1. Created AWS infrastructure using terraform. This includes:
- a VPC
- a public subnet
- an internet gateway
- route table and its association for internet connection
- an ec2 instance
- a security group to attach to the instance
- IAM roles and instance profile for the ec2 instance
- an ECR repository to store the docker image within ec2 instance

2. Wrote a simple Flask application code

3. Created a Dockerfile to package the Flask application and its dependencies

