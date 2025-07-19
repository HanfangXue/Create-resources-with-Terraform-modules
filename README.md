# Create-resources-with-Terraform-modules
User Story
As a product manager, I want the DevOps Engineer to use Terraform modules to deploy a secure, scalable web application environment in AWS, including an Application Load Balancer (ALB), EC2 app servers running Docker, and tightly controlled security groups—so our team can run and scale containerised apps efficiently and securely.

🎯 Your Task
You are required to:

Use Terraform modules for all resource provisioning.

Use variables for all key settings (Sample VPC and its subnets, AMI, instance type, etc).

Make sure all resource names and outputs are easily identifiable (include your name or initials).

📌 Steps to Complete
✅ 1. Prepare Your Terraform Project
Create a directory terraform-alb-app.

Define main.tf, variables.tf, outputs.tf, and terraform.tfvars.

Initialise your provider and remote backend (S3 is recommended, as before).

Suggested directory structure:



terraform-alb-app/
├── main.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
└── modules/
    ├── ec2_instance/
    ├── alb/
    └── security_group/
✅ 2. Create the EC2 App Server Module
Use the module to launch at least one EC2 instance (Amazon Linux 2 or Ubuntu 22.04+)

Create Dockerfile with below and run it as container:



FROM python:3.9-slim

WORKDIR /app
RUN echo "Hello World!" > index.html

EXPOSE 80
CMD python -m http.server 80
Pass in your key pair name (e.g., yourname_alb_key.pem) and ensure you can SSH into the instance using it.

✅ 3. Create the Security Group Module
ALB should have its own Security Group (allowing inbound 80/443 from anywhere).

EC2 should have its own Security Group (allowing inbound 80 only from the ALB Security Group; and 22 only from your own IP).

Egress (outbound) can be open.

✅ 4. Create the Application Load Balancer Module
ALB must be deployed in public subnets, with its Target Group pointing to your EC2 instance (using private IP or instance ID).

Set up a listener (port 80, HTTP; port 443 optional).

Output the ALB DNS name for testing.

✅ 5. Outputs
In outputs.tf, print:

The ALB DNS name

The App Server Private IP

The App Server Instance ID

🛡 Security & Validation
EC2 should NOT be directly accessible from the internet (no 0.0.0.0/0 on port 22/80/443).

Only the ALB can access the EC2’s port 80.

Only your public IP can SSH into the EC2 (port 22).

ALB must be reachable from the internet (port 80).

You must be able to SSH into the EC2 and run docker ps to confirm the hello-world container is running.
