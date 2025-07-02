resource "aws_vpc" "example_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "MyGitHubActionsVPC"
  }
}
