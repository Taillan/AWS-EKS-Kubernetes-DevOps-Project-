resource "aws_vpc" "EKS_VPC" {
  cidr_block = var.vpc_cidr
  tags = {
    Terraform = "true"
    "Name" = "Terrafom EKS VPC"
    "owner" = var.owner
  }
}

# Create public subnets AZ 1
resource "aws_subnet" "web_public_subnet_3a" {
  vpc_id = aws_vpc.EKS_VPC.id
  cidr_block = var.public_cidr_subnet[0]
  availability_zone = var.az[0]
  map_public_ip_on_launch = true
  tags = {
    Terraform = "true"
    "Name" = "Terrafom EKS Public Subnet 3a"
    "owner" = var.owner
  }
}

# Create public subnets AZ 2
resource "aws_subnet" "web_public_subnet_3b" {
  vpc_id = aws_vpc.EKS_VPC.id
  cidr_block = var.public_cidr_subnet[1]
  availability_zone = var.az[1]
  map_public_ip_on_launch = true
  tags = {
    Terraform = "true"
    "Name" = "Terrafom EKS Public Subnet 3a"
    "owner" = var.owner
  }
}

# Create public subnets AZ 3
resource "aws_subnet" "web_public_subnet_3c" {
  vpc_id = aws_vpc.EKS_VPC.id
  cidr_block = var.public_cidr_subnet[2]
  availability_zone = var.az[2]
  map_public_ip_on_launch = true
  tags = {
    Terraform = "true"
    "Name" = "Terrafom EKS Public Subnet 3a"
    "owner" = var.owner
  }
}

# Creating app private subnets AZ 1
resource "aws_subnet" "app_private_subnet_3a" {
  vpc_id = aws_vpc.EKS_VPC.id
  cidr_block = var.private_cidr_subnet[0]
  availability_zone = var.az[0]
  tags = {
    Terraform = "true"
    "Name" = "Terrafom EKS Application Subnet 3a"
    "owner" = var.owner
  }
}

# Creating app private subnets AZ 2
resource "aws_subnet" "app_private_subnet_3b" {
  vpc_id = aws_vpc.EKS_VPC.id
  cidr_block = var.private_cidr_subnet[1]
  availability_zone = var.az[1]
  tags = {
    Terraform = "true"
    "Name" = "Terrafom EKS Application Subnet 3b"
    "owner" = var.owner
  }
}

# Creating app private subnets AZ 3
resource "aws_subnet" "app_private_subnet_3c" {
  vpc_id = aws_vpc.EKS_VPC.id
  cidr_block = var.private_cidr_subnet[2]
  availability_zone = var.az[2]
  tags = {
    Terraform = "true"
    "Name" = "Terrafom EKS Application Subnet 3c"
    "owner" = var.owner
  }
}

# Creating db private subnets AZ 1
resource "aws_subnet" "db_private_subnet_3a" {
  vpc_id = aws_vpc.EKS_VPC.id
  cidr_block = var.private_cidr_subnet[3]
  availability_zone = var.az[0]
  tags = {
    Terraform = "true"
    "Name" = "Terrafom EKS Database Subnet 3a"
    "owner" = var.owner
  }
}

# Creating db private subnets AZ 2
resource "aws_subnet" "db_private_subnet_3b" {
  vpc_id = aws_vpc.EKS_VPC.id
  cidr_block = var.private_cidr_subnet[4]
  availability_zone = var.az[1]
  tags = {
    Terraform = "true"
    "Name" = "Terrafom EKS Database Subnet 3b"
    "owner" = var.owner
  }
}

# Creating db private subnets AZ 3
resource "aws_subnet" "db_private_subnet_3c" {
  vpc_id = aws_vpc.EKS_VPC.id
  cidr_block = var.private_cidr_subnet[5]
  availability_zone = var.az[2]
  tags = {
    Terraform = "true"
    "Name" = "Terrafom EKS Database Subnet 3c"
    "owner" = var.owner
  }
}