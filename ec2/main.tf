terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1" # Replace with your desired region
}

resource "aws_instance" "example" {
  ami           = "ami-0f918f7e67a3323f0" # Replace with your desired AMI ID
  instance_type = "t2.micro" # Choose an appropriate instance type
  tags = {
    Name = "MyTerraformEC2"
  }
}
