# Multi-Environment AWS Infrastructure with Terraform

**Description:**
This repository contains Terraform modules for provisioning and managing AWS infrastructure across different environments—Development, Staging, and Production. It automates the creation of key AWS resources such as EC2 instances, S3 buckets, VPCs, and security groups. The configuration is modular, allowing for easy scaling and management across environments.

## Features
- **Modular Structure**: Separate modules for `dev`, `stg`, and `prod` environments.
- **AWS EC2 Instances**: Automatically provisions instances with environment-specific configurations with enviroment variable tags.
- **S3 Buckets**: Creates environment-based S3 buckets with enviroment variable tags.
- **Key Pair Management**: Secure SSH access is managed via key pairs, using an AWS key pair for deployment.
- **Security Groups**: Configures security groups to allow SSH access and secure inbound, outbound traffic.
- **VPC**: Provisions a default VPC with tagging for better resource management.
--

## Requirements

- **Terraform**: v1.0+
- **AWS CLI**: Configured with necessary permissions and login secret keys.
- **SSH Key**: Required for SSH access to the EC2 instances.

--
1. **Clone the repository**:
```bash
git clone https://github.com/AvinashSaxena17/Aws-Multi-Env-using-terraform.git
cd Aws-Multi-Env-using-terraform
```
2. **Configure the variables**: Update the variables in the `variables.tf` files according to your environment (e.g., update the SSH key path in the `aws_key_pair` resource).
3. **Generate the SSH key**: Use the command `ssh-keygen` to generate a key to connect the aws.
4.  **Initialize Terraform**:
    ```bash
    terraform init
    ```
5. **Apply the configuration**:
    ```bash
    terraform apply
    ```
    Terraform will prompt for confirmation before applying the changes. Once confirmed, the infrastructure will be created.
---
## File Structure

```
.
├── modules
│   └── aws_infra
│       ├── ec2.tf
│       ├── s3_bucket.tf
│       └── variables.tf
├── main.tf
│── provider.tf
│── terraform.tf
└── README.md
        
```
---
## Environment Variables

- `env`: Specifies the environment (`development`, `staging`, or `production`).
- `ami`: Amazon Machine Image ID for the EC2 instance.
- `instance_type`: Type of instances to launch.
- `instance_count`: Number of instances to launch. Default is 1 but can be overridden in production.
- `bucket_name`: The name of the DynamoDB table for each environment.

---

## Security Considerations

- Ensure your AWS credentials are stored securely and not hardcoded in the repository.
- Update the SSH key path to your own public key.
- Security groups allow SSH traffic from `0.0.0.0/0`. Modify this for more restrictive access based on your security policies.

---
## Future Improvements

- **Integrate Auto Scaling** to enhance availability and performance in the production environment.
- Configure monitoring and logging for EC2 instances using **AWS CloudWatch**.
- Configured **IAM Role & Policies** for improved security and compliance.





   


    







