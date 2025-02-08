resource "aws_iam_role" "EKS_Cluster_role" {
  name = "EKS_Cluster_role"
  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": [
                    "eks.amazonaws.com"
                ]
            },
            "Action": "sts:AssumeRole"
        }
    ]
    })

    tags = {
        Terraform = "true"
        Name = "Terrafom EKS Cluster Role"
        Owner = var.owner
    }
}

resource "aws_iam_role_policy_attachment" "EKS_Cluster_AmazonEKSClusterPolicy" {
    role       = aws_iam_role.EKS_Cluster_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_role" "EKS_Node_role" {
  name = "EKS_Node_role"
  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "sts:AssumeRole"
            ],
            "Principal": {
                "Service": [
                    "ec2.amazonaws.com"
                ]
            }
        }
    ]
    })

    tags = {
        Terraform = "true"
        Name = "Terrafom EKS Node Role"
        Owner = var.owner
    }
}

resource "aws_iam_role_policy_attachment" "EKS_Node_AmazonEC2ContainerRegistryReadOnly" {
    role       = aws_iam_role.EKS_Node_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

resource "aws_iam_role_policy_attachment" "EKS_Node_AmazonEKS_CNI_Policy" {
    role       = aws_iam_role.EKS_Node_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

resource "aws_iam_role_policy_attachment" "EKS_Node_AmazonEKSWorkerNodePolicy" {
    role       = aws_iam_role.EKS_Node_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_role_policy_attachment" "EKS_Node_AWSXrayWriteOnlyAccess" {
    role       = aws_iam_role.EKS_Node_role.name
    policy_arn = "arn:aws:iam::aws:policy/AWSXrayWriteOnlyAccess"
}

resource "aws_iam_role_policy_attachment" "EKS_Node_CloudWatchAgentServerPolicy" {
    role       = aws_iam_role.EKS_Node_role.name
    policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

resource "aws_iam_role" "linux-jump-server-role" {
  name = "Linux-Jump-Server-Role"
  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "sts:AssumeRole"
            ],
            "Principal": {
                "Service": [
                    "ec2.amazonaws.com"
                ]
            }
        }
    ]
    })

    tags = {
        Terraform = "true"
        Name = "Terrafom EKS Node Role"
        Owner = var.owner
    }
}

resource "aws_iam_role" "jenkins-slave-role" {
  name = "Jenkins-Slave-Role"
  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "sts:AssumeRole"
            ],
            "Principal": {
                "Service": [
                    "ec2.amazonaws.com"
                ]
            }
        }
    ]
    })

    tags = {
        Terraform = "true"
        Name = "Terrafom EKS Node Role"
        Owner = var.owner
    }
}

resource "aws_iam_role_policy_attachment" "JenkinsSlave_AmazonEC2ContainerRegistryFullAccess" {
    role       = aws_iam_role.jenkins-slave-role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
}