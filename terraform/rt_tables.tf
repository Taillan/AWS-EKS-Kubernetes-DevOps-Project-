#Create aws route tables
resource "aws_route_table" "public" {
    vpc_id = aws_vpc.EKS_VPC.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.internet_gateway.id
        }
    tags = {
        Terraform = "true"
        Name = "Terrafom EKS Public Route Table"
        Owner = var.owner
  }
}

#Create aws route tables private AZ 1
resource "aws_route_table" "private_3a" {
    vpc_id = aws_vpc.EKS_VPC.id

    route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway_3a.id
        }
    tags = {
        Terraform = "true"
        Name = "Terrafom EKS Private Route Table app 3a"
        Owner = var.owner
  }
}

#Create aws route tables private AZ 2
resource "aws_route_table" "private_3b" {
    vpc_id = aws_vpc.EKS_VPC.id

    route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway_3b.id
        }
    tags = {
        Terraform = "true"
        Name = "Terrafom EKS Private Route Table app 3b"
        Owner = var.owner
  }
}

#Create aws route tables private AZ 3
resource "aws_route_table" "private_3c" {
    vpc_id = aws_vpc.EKS_VPC.id

    route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway_3c.id
        }
    tags = {
        Terraform = "true"
        Name = "Terrafom EKS Private Route Table app 3c"
        Owner = var.owner
  }
}