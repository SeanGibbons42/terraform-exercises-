variable "vpc_cidr" {
    type = string
    description = "IP range for this VPC"
    default = "10.0.0.0/16"
}

variable "vpc_name" {
    type = string
    nullable = true
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

