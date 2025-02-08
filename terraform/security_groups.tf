resource "aws_security_group" "EC2_LinuxJumpServer" {
    name        = "EC2_LinuxJumpServer"
    description = "Security group for EC2 Linux Jump Server"
    vpc_id      = aws_vpc.EKS_VPC.id

    tags = {
        Terraform = "true"
        Name      = "Terrafom EKS Cluster Role"
        Owner     = var.owner
    }
}

resource "aws_security_group" "EKS_Cluster" {
    name        = "EKS_Cluster"
    description = "Security group for EKS Cluster"
    vpc_id      = aws_vpc.EKS_VPC.id

    tags = {
        Terraform = "true"
        Name      = "Terrafom EKS Cluster Role"
        Owner     = var.owner
    }
}

resource "aws_security_group" "ECR" {
    name        = "ECR"
    description = "Security group for ECR"
    vpc_id      = aws_vpc.EKS_VPC.id

    tags = {
        Terraform = "true"
        Name      = "Terrafom EKS Cluster Role"
        Owner     = var.owner
    }
}

resource "aws_security_group" "EC2_Jenkins_Master" {
    name        = "EC2_Jenkins_Master"
    description = "Security group for EC2 Jenkins Master"
    vpc_id      = aws_vpc.EKS_VPC.id

    tags = {
        Terraform = "true"
        Name      = "Terrafom EKS Cluster Role"
        Owner     = var.owner
    }
}

resource "aws_security_group" "EC2_Jenkins_Slave" {
    name        = "EC2_Jenkins_Slave"
    description = "Security group for EC2 Jenkins Slave"
    vpc_id      = aws_vpc.EKS_VPC.id

    tags = {
        Terraform = "true"
        Name      = "Terrafom EKS Cluster Role"
        Owner     = var.owner
    }
}
