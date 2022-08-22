# cidrsubnet(vpc_cidr, subnet_address_space_size, order)
variable "cidr_range" {
    type = string
    description = "CIDR block for this subnet"
}

variable "vpc_id" {
    type = string
    description = "VPC to place this subnet in"
}

variable "availability_zone" {
    type = string
    description = "AZ for this subnet"
}

variable "subnet_name" {
    type = string
}

variable "owner" {
    type = string
    description = "Owner of these resources"
    default = "Sean!"
}

variable "purpose" {    
    type  = string
    description = "Purpose/project of this subnet"
    default = "learning"
}

