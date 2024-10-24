
provider "aws" {
  region = "us-east-1"
}

#VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidrblock
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    "Name" = "main-vpc"
  }
}

#Public Subnet
resource "aws_subnet" "public" {
  cidr_block = var.subnet_cidr[0]
  map_public_ip_on_launch = true
  vpc_id = aws_vpc.main.id
  availability_zone = "${var.region}a"
}

# Internet Gateway
resource "aws_internet_gateway" "igw_main" {
  vpc_id = aws_vpc.main.id
  tags = {
    "Name" = "main-IG"
  }
}

# Public Route Table
resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.main.id
  tags = {
    "Name" = "public-route"
  }
}

# Associating public route table to public subnet
resource "aws_route_table_association" "public_association" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.public_route.id
}

# Route to IGW for public subnet
resource "aws_route" "public_internet_access" {
  route_table_id = aws_route_table.public_route.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw_main.id
}


