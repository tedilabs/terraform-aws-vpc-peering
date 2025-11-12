provider "aws" {
  region = "us-east-1"
}

module "vpc_use1" {
  source = "tedilabs/network/aws//modules/vpc"

  region = "us-east-1"

  name = "use1"
  ipv4_cidrs = [
    {
      type = "MANUAL"
      cidr = "10.1.0.0/16"
    }
  ]

  dns_hostnames_enabled = true
  route53_resolver = {
    enabled = true
  }
}

module "vpc_apne2" {
  source = "tedilabs/network/aws//modules/vpc"

  region = "ap-northeast-2"

  name = "apne2"
  ipv4_cidrs = [
    {
      type = "MANUAL"
      cidr = "10.2.0.0/16"
    }
  ]

  dns_hostnames_enabled = true
  route53_resolver = {
    enabled = true
  }
}


###################################################
# Requester for VPC Peering
###################################################

module "requester" {
  source = "../../modules/requester"
  # source  = "tedilabs/vpc-peering/aws//modules/requester"
  # version = "~> 0.2.0"

  region = "us-east-1"

  name = "use1/apne2"

  requester = {
    vpc = module.vpc_use1.id
  }
  accepter = {
    vpc    = module.vpc_apne2.id
    region = "ap-northeast-2"
  }

  allow_remote_vpc_dns_resolution = false

  tags = {
    "project" = "terraform-aws-vpc-peering-examples"
  }
}


###################################################
# Accepter for VPC Peering
###################################################

module "accepter" {
  source = "../../modules/accepter"
  # source  = "tedilabs/vpc-peering/aws//modules/accepter"
  # version = "~> 0.2.0"

  region = "ap-northeast-2"

  name = "use1/apne2"

  peering_connection = {
    id = module.requester.id
  }

  allow_remote_vpc_dns_resolution = false

  tags = {
    "project" = "terraform-aws-vpc-peering-examples"
  }
}
