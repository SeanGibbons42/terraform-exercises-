terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~>4.27.0"
    }
  }
}

provider "aws" {
    region = "us-east-1"
}

module "vpc" {
    source = "./network"

    vpc_cidr = "10.0.0.0/16"
    vpc_name = "learning_vpc"
}

module "subnet1" {
    source = "./public_subnet"

    vpc_id = module.vpc.vpc_id
    cidr_range = cidrsubnet("10.0.0.0/16", 4, 0)
    subnet_name = "LearningSubnetA"
    availability_zone = "us-east-1a"
}

