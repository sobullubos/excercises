# Require Terraform version 1.1 or newer
terraform {

  # List of providers required by this configuration
  required_providers {

    # Define the AWS provider
    aws = {

      # Download the AWS provider from the HashiCorp registry
      source = "hashicorp/aws"

      # Use version 3.74 or any compatible 3.x version newer than 3.74
      # but not version 4.x
      version = "~> 3.74"
    }
  }
}

# Configure the AWS provider
provider "aws" {

  # Use the AWS profile named "default"
  # from ~/.aws/credentials
  profile = "default"

  # Use the Frankfurt AWS region
  region = "eu-central-1"
}

# Read information about an existing AMI from AWS
data "aws_ami" "amazon_linux" {

  # Return the newest matching AMI
  most_recent = true

  # Restrict the search to images published by Amazon
  owners = ["amazon"]

  # Filter the AMIs by name
  filter {

    # Filter on the AMI name attribute
    name = "name"

    # Find Amazon Linux 2023 x86_64 images
    values = ["al2023-ami-*-x86_64"]
  }
}

# Define an EC2 instance resource to create
resource "aws_instance" "my_instance" {

  # Use the AMI ID returned by the lookup above
  ami = data.aws_ami.amazon_linux.id

  # Create a Free-Tier-sized EC2 instance
  instance_type = "t3.micro"

  # Apply tags to the instance
  tags = {

    # Name tag visible in the AWS console
    Name = "terraform-demo"
  }
}

# Define an output variable
# displayed after terraform apply
output "instance_id" {

  # Return the ID of the created EC2 instance
  value = aws_instance.my_instance.id
}

# Define another output variable
output "public_ip" {

  # Return the public IP address assigned by AWS
  value = aws_instance.my_instance.public_ip
}