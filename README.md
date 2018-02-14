### Terraform AWS Account
Usage:
1. [Install the AWS CLI](https://aws.amazon.com/cli/)
2. [Install Terraform](https://www.terraform.io/downloads.html)
3. Create your AWS Account.
4. Setup a new IAM user with Programmatic access (Access Key ID and Secret Access Key) with permissions to create VPC/Config/Cloudtrail and its subcomponents
5. Setup your profile in your AWS CLI with the newly created IAM user (Access Key ID and Secret Access Key), clone this repository and get Terraform started:
```
aws --profile your_profile_name configure
git clone https://github.com/devlinrcg/terraform-aws-account.git
cd terraform-aws-account
terraform init
```
6. Edit vars.tf to your needs: all Tag information and CIDR configuration are set up in this file and you'll be prompt to enter the AWS Region everytime you plan or apply:
7. Plan everything:
```
terraform plan
```
8. Execute:
```
terraform apply
```

TO DO:
* tbd