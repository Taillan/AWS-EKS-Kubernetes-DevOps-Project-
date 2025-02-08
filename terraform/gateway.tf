# Creating Internet Gateway 
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.EKS_VPC.id

  tags = {
    Terraform = "true"
    Name  = "Terraform EKS IG"
    Owner = var.owner
  }
}

resource "aws_nat_gateway" "nat_gateway_3a" {
  connectivity_type                  = "private"
  subnet_id     = aws_subnet.web_public_subnet_3a.id

  tags = {
    Terraform = "true"
    Name      = "Terraform EKS NAT Gateway 3a"
    Owner     = var.owner
  }
}

resource "aws_nat_gateway" "nat_gateway_3b" {
  connectivity_type                  = "private"
  subnet_id     = aws_subnet.web_public_subnet_3b.id

  tags = {
    Terraform = "true"
    Name      = "Terraform EKS NAT Gateway 3b"
    Owner     = var.owner
  }
}

resource "aws_nat_gateway" "nat_gateway_3c" {
  connectivity_type                  = "private"
  subnet_id     = aws_subnet.web_public_subnet_3c.id

  tags = {
    Terraform = "true"
    Name      = "Terraform EKS NAT Gateway 3c"
    Owner     = var.owner
  }
}