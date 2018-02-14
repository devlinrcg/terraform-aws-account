provider "aws" {
  region = "${var.vpc_region}"
  shared_credentials_file = "${var.credentials_file}"
  profile                 = "${var.profile}"
}
resource "aws_internet_gateway" "gw" {
   vpc_id = "${aws_vpc.Main.id}"
    tags {
        Name = "${var.igw_name}"
    }
}
resource "aws_vpc" "Main" {
  cidr_block = "${var.vpc_cidr}"
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true
   tags {
    Name = "${var.vpc_name}"
    }
}
resource "aws_network_acl" "all" {
   vpc_id = "${aws_vpc.Main.id}"
    egress {
        protocol = "-1"
        rule_no = 2
        action = "allow"
        cidr_block =  "0.0.0.0/0"
        from_port = 0
        to_port = 0
    }
    ingress {
        protocol = "-1"
        rule_no = 1
        action = "allow"
        cidr_block =  "0.0.0.0/0"
        from_port = 0
        to_port = 0
    }
    tags {
        Name = "${var.acl_name}"
    }
}
resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.Main.id}"
  tags {
      Name = "${var.public_rt}"
  }
  route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.gw.id}"
    }
}

resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.Main.id}"
  tags {
      Name = "${var.private_rt}"
  }
  route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.NatGW.id}"
  }
}
resource "aws_eip" "NatEIP" {
    vpc      = true
}
resource "aws_nat_gateway" "NatGW" {
    allocation_id = "${aws_eip.NatEIP.id}"
    subnet_id = "${aws_subnet.Subnet_Public.id}"
    depends_on = ["aws_internet_gateway.gw"]
    tags {
        Name = "${var.natgw_private_name}"
  }
}
resource "aws_subnet" "Subnet_Public" {
  vpc_id = "${aws_vpc.Main.id}"
  cidr_block = "${var.subnet_public}"
  tags {
        Name = "${var.public_subnet_name}"
  }
 availability_zone = "${data.aws_availability_zones.available.names[0]}"
}
data "aws_availability_zones" "available" {}
resource "aws_route_table_association" "Subnet_Public" {
    subnet_id = "${aws_subnet.Subnet_Public.id}"
    route_table_id = "${aws_route_table.public.id}"
}
resource "aws_subnet" "Subnet_Private" {
  vpc_id = "${aws_vpc.Main.id}"
  cidr_block = "${var.subnet_private}"
  tags {
        Name = "${var.private_subnet_name}"
  }
  availability_zone = "${data.aws_availability_zones.available.names[1]}"
}
resource "aws_route_table_association" "Subnet_Private" {
    subnet_id = "${aws_subnet.Subnet_Private.id}"
    route_table_id = "${aws_route_table.private.id}"
}