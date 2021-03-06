### Terraform AWS Account
Components that will be created:
* One (1) VPC
* Two (2) Subnets: one private, one public
* One (1) NAT Gateway for the private subnet
* One (1) Internet Gateway for the public subnet
* Two (2) Route Tables
* AWS Config
* AWS Cloudtrail (all Regions, all APIs)

Usage:
1. [Install the AWS CLI](https://aws.amazon.com/cli/)
2. [Install Terraform](https://www.terraform.io/downloads.html)
3. Create your AWS Account
4. Setup a new IAM user with Programmatic access (Access Key ID and Secret Access Key) with permissions to create VPC/Config/Cloudtrail and its subcomponents
5. Setup your profile in your AWS CLI with the newly created IAM user (you'll have to put this into vars.tf credentials_file and profile entries)
```
aws --profile your_profile_name configure
```
6. Clone this repository and get Terraform started:
```
git clone https://github.com/devlinrcg/terraform-aws-account.git
cd terraform-aws-account
terraform init
```
7. Edit vars.tf to your needs: the profile that will be used, all Tag information and CIDR configuration are set up in this file and you'll be prompt to enter the AWS Region everytime you plan or apply
8. Plan everything:
```
terraform plan
```
9. If everything is good, execute:
```
terraform apply
```

The output will be provided with the entries in outputs.tf (basic information)

TO DO:
* tbd
