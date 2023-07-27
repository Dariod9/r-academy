terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "rio-vpc" {
  cidr_block = "10.0.0.0/23"
  tags = {
    "Name" = "rio-vpc"
    }
}

resource "aws_internet_gateway" "rio-gateway" {
  tags     = {
    "Name" = "rio-gateway"
    } 
  vpc_id   = "vpc-04643ce6f5e2a1446"
}

resource "aws_nat_gateway" "rio-nat1" {
  connectivity_type    = "public"
  subnet_id = aws_subnet.rio-public1.id
  private_ip           = "10.0.0.117"
  tags = {
    "Name" = "rio-nat1"
    }
}

resource "aws_nat_gateway" "rio-nat2" {
  connectivity_type    = "public"
  subnet_id = aws_subnet.rio-public2.id
  private_ip           = "10.0.0.165"
  tags = {
    "Name" = "rio-nat2"
    }
}

resource "aws_subnet" "rio-public1" {
  availability_zone                              = "us-east-1a"
  cidr_block                                     = "10.0.0.0/25"
  tags                                           = {
    "Name" = "rio-public1"
    }
  vpc_id                                         = "vpc-04643ce6f5e2a1446"
}

resource "aws_subnet" "rio-public2" {
  availability_zone                              = "us-east-1b"
  cidr_block                                     = "10.0.0.128/25"
  tags                                           = {
    "Name" = "rio-public2"
    }
  vpc_id                                         = "vpc-04643ce6f5e2a1446"
}

resource "aws_subnet" "rio-private1" {
  availability_zone                              = "us-east-1a"
  cidr_block                                     = "10.0.1.0/25"
  tags                                           = {
    "Name" = "rio-private1"
    }
  vpc_id                                         = "vpc-04643ce6f5e2a1446"
}

resource "aws_subnet" "rio-private2" {
  availability_zone                              = "us-east-1b"
  cidr_block                                     = "10.0.1.128/25"
  tags                                           = {
    "Name" = "rio-private2"
    }
  vpc_id                                         = "vpc-04643ce6f5e2a1446"
}