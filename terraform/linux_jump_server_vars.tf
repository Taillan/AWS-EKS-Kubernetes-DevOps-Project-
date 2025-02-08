variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "Free tier instance"
}

variable "ami_id" {
    type = string
    default = "ami-07dc1ccdcec3b4eab"
    description = "Amazon Linux 2023 AMI 2023.6.2"
}