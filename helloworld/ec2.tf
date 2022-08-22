terraform {
  required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "4.10.0"  
      }
  }
}

provider "aws"  {
    profile = "personal-admin"
    region = "us-east-1"
}

# latest Amazon Linux 2 ami
data "aws_ami" "amazon_linux_2" {
    most_recent = true


    filter {
        name   = "name"
        values = ["amzn2-ami-kernel-5.10-hvm-2.0.20220406.1-x86_64-gp2"]
    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }
    owners = ["amazon"] # Canonical
}


resource "aws_instance" "tf-helloworld-instance" {
    ami = data.aws_ami.amazon_linux_2.id
    instance_type = "t3.nano"
    availability_zone = "us-east-1a"

    # root drive 
    root_block_device {
        volume_size = 15
      delete_on_termination = true
      encrypted = true

      tags = {
          Name = "tf-helloworld-volume"
      }
    }

    tags = {
        Name = "tf-helloworld-instance"
        owner = "sean"
        purpose = "learnin terraform"
    }
}

