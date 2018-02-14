# ---------------------------------------------------------------------------------------------------------------------
# ENVIRONMENT VARIABLES
# Define all variables as parameters to be used in the script;
# You'll have to edit this file and modify these parameters to proceed
# Also edit the CIDR for the VPC and Subnets
# ---------------------------------------------------------------------------------------------------------------------

variable "credentials_file" {
    description = "Your Credentials File"
    default = "/path/to/.aws/credentials"
}

variable "profile" {
    description = "The Profile set"
    default = "YOUR_ENTRY_HERE"
}

variable "vpc_name" {
    description = "Tag for your VPC Name"
    default = "YOUR_ENTRY_HERE"
}

variable "igw_name" {
    description = "Tag for Internet Gateway Name"
    default = "YOUR_ENTRY_HERE"
}

variable "acl_name" {
    description = "Tag for ACL Name"
    default = "YOUR_ENTRY_HERE"
}

variable "public_rt" {
    description = "Tag for Public Route Table Name"
    default = "YOUR_ENTRY_HERE"
}

variable "private_rt" {
    description = "Tag for Private Route Table Name"
    default = "YOUR_ENTRY_HERE"
}

variable "natgw_private_name" {
    description = "Tag for Private Nate GAteway Name"
    default = "YOUR_ENTRY_HERE"
}

variable "public_subnet_name" {
    description = "Tag for Public Subnet Name"
    default = "YOUR_ENTRY_HERE"
}

variable "private_subnet_name" {
    description = "Tag for Public Subnet Name"
    default = "YOUR_ENTRY_HERE"
}

variable "config_s3_bucket_name" {
    description = "Tag for the S3 Bucket where all Config will be put in"
    default = "YOUR_ENTRY_HERE"
}

variable "cloudtrail_s3_bucket_name" {
    description = "Tag for the S3 Bucket where all Cloudtrail will be put in"
    default = "YOUR_ENTRY_HERE"
}

variable "vpc_region" {
    description = "Input one of the AWS Regions us-east-2, us-east-1, us-west-1, us-west-2, ap-northeast-1, ap-northeast-2, ap-south-1, ap-southeast-1, ap-southeast-2, ca-central-1, cn-north-1, cn-northwest-1, eu-central-1, eu-west-1, eu-west-2, eu-west-3, sa-east-1"
}

variable "vpc_cidr" {
    description = "VPC CIDR configuration"
    default = "172.32.5.0/24" # Change to a CIDR in the 0.0.0.0/0 format
}

variable "subnet_public" {
  default = "172.32.5.0/25" # Change to a CIDR in the 0.0.0.0/0 format
  description = "the cidr of the subnet"
}
variable "subnet_private" {
  default = "172.32.5.128/25" # Change to a CIDR in the 0.0.0.0/0 format
  description = "the cidr of the subnet"
}