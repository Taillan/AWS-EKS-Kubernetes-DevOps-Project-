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

resource "aws_eks_node_group" "EKS_DevOps_Node_Group" {
    cluster_name    = aws_eks_cluster.EKS_DevOps_Cluster.name
    node_group_name = "EKS_DevOps_Node_Group"
    node_role_arn   = aws_iam_role.EKS_Node_role.arn

    subnet_ids = [
        aws_subnet.app_private_subnet_3a.id,
        aws_subnet.app_private_subnet_3b.id,
        aws_subnet.app_private_subnet_3c.id
    ]

    remote_access {
        ec2_ssh_key = "EKS_Node_group"
        source_security_group_ids = [
            aws_security_group.EKS_Node_Group_sg.id
        ]
    }

    ami_type = "AL2023_x86_64_STANDARD"
    instance_types = ["t3.micro"]
    disk_size = 20

    scaling_config {
        desired_size = 2
        max_size     = 2
        min_size     = 2
    }

    depends_on = [ aws_iam_role_policy_attachment.EKS_Node_AmazonEC2ContainerRegistryReadOnly,
                   aws_iam_role_policy_attachment.EKS_Node_AmazonEKS_CNI_Policy,
                   aws_iam_role_policy_attachment.EKS_Node_AmazonEKSWorkerNodePolicy,
                   aws_iam_role_policy_attachment.EKS_Node_AWSXrayWriteOnlyAccess,
                   aws_iam_role_policy_attachment.EKS_Node_CloudWatchAgentServerPolicy
                 ]

    tags = {
        Terraform = "true"
        Name      = "EKS_DevOps_Node_Group"
        Owner     = var.owner
    }
}