resource "aws_security_group" "EC2_LinuxJumpServer_sg" {
    name        = "EC2_LinuxJumpServer_sg"
    description = "Security group for EC2 Linux Jump Server"
    vpc_id      = aws_vpc.EKS_VPC.id

    tags = {
        Terraform = "true"
        Owner     = var.owner
    }
}

resource "aws_security_group" "EKS_Cluster_sg" {
    name        = "EKS_Cluster_sg"
    description = "Security group for EKS Cluster"
    vpc_id      = aws_vpc.EKS_VPC.id

    tags = {
        Terraform = "true"
        Owner     = var.owner
    }
}

resource "aws_security_group" "ECR_sg" {
    name        = "ECR_sg"
    description = "Security group for ECR"
    vpc_id      = aws_vpc.EKS_VPC.id

    tags = {
        Terraform = "true"
        Owner     = var.owner
    }
}

resource "aws_security_group" "EC2_Jenkins_Master_sg" {
    name        = "EC2_Jenkins_Master_sg"
    description = "Security group for EC2 Jenkins Master"
    vpc_id      = aws_vpc.EKS_VPC.id

    tags = {
        Terraform = "true"
        Owner     = var.owner
    }
}

resource "aws_security_group" "EC2_Jenkins_Slave_sg" {
    name        = "EC2_Jenkins_Slave_sg"
    description = "Security group for EC2 Jenkins Slave"
    vpc_id      = aws_vpc.EKS_VPC.id

    tags = {
        Terraform = "true"
        Owner     = var.owner
    }
}
