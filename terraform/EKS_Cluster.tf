resource "aws_eks_cluster" "EKS_DevOps_Cluster" {
    name     = "EKS_DevOps_Cluster"
    role_arn = aws_iam_role.EKS_Cluster_role.arn

  access_config {
    bootstrap_cluster_creator_admin_permissions = true
    authentication_mode = "API_AND_CONFIG_MAP"
  }

    vpc_config {
        subnet_ids = [
            aws_subnet.app_private_subnet_3a.id,
            aws_subnet.app_private_subnet_3b.id,
            aws_subnet.app_private_subnet_3c.id
        ]
        security_group_ids = [
            aws_security_group.EKS_Cluster_sg.id
        ]
        endpoint_private_access = true
    }

    depends_on = [
        aws_iam_role_policy_attachment.EKS_Cluster_AmazonEKSClusterPolicy
    ]

  tags = {
    Terraform = "true"
    Name      = "Terraform EKS NAT Gateway 3a"
    Owner     = var.owner
    }
}