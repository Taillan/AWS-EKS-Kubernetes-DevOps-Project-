variable "owner" {
    type = string
    description = "Owner of the ressource"
}

variable "vpc_cidr" {
    type = string
    description = "VPC cidr"
}

variable "az" {
  description = "Availability zone for subnets"
}

variable "public_cidr_subnet" {
  type        = list(string)
  default     = []
  description = "Public subnet cidr list"
}

variable "private_cidr_subnet" {
  type        = list(string)
  default     = []
  description = "Private subnet cidr list"
}