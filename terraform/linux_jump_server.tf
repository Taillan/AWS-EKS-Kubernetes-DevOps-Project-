resource  "aws_instance" "linux_jump_server" {

    # AMI ID to launch
    ami = var.ami_id

    # Instance type ( fe: t2.micro )
    instance_type = var.instance_type

    # VPC Subnet ID to associate with
    subnet_id = aws_vpc.EKS_VPC.id

    # Key pair name to associate with
    key_name = "Linux_jump_server"

    # List of security group names to associate with
    vpc_security_group_ids = [aws_security_group.EC2_LinuxJumpServer.id]
    
    # Associate a public IP address with the instance
    associate_public_ip_address = true

    # Block device mapping ( EBS volume )
    root_block_device {
        volume_size = 8
        volume_type = "gp3"
        encrypted = false
    }

    tags ={
        Name = "Linux Jump Server"
        Terraform = "true"
        Owner = var.owner
    }
}