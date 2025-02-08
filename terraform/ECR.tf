resource "aws_ecr_repository" "Devops-EKS-ECR-repo" {
    name                 = "Devops-EKS-ECR-repo"

    image_scanning_configuration {
        scan_on_push = false
    }
}

output "repository_url" {
    value = aws_ecr_repository.my_ecr_repo.repository_url
}