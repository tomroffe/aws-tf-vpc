module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 2.24.0"

  name                 = local.vpc_name
  cidr                 = var.vpc_cidr
  azs                  = data.aws_availability_zones.available.names
  private_subnets      = var.private_subnet_cidrs
  public_subnets       = var.public_subnet_cidrs
  database_subnets     = var.database_subnet_cidrs
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true
  enable_dns_support   = true

  # VPC endpoint for S3
  enable_s3_endpoint = false

  # VPC endpoint for DynamoDB
  enable_dynamodb_endpoint = false

  # VPC Endpoint for EC2
  enable_ec2_endpoint              = false
  ec2_endpoint_private_dns_enabled = false
  ec2_endpoint_security_group_ids  = [data.aws_security_group.default.id]

  # VPC Endpoint for EC2MESSAGES
  enable_ec2messages_endpoint              = false
  ec2messages_endpoint_private_dns_enabled = false
  ec2messages_endpoint_security_group_ids  = [data.aws_security_group.default.id]

  # VPC Endpoint for ECR API
  enable_ecr_api_endpoint              = false
  ecr_api_endpoint_private_dns_enabled = false
  ecr_api_endpoint_security_group_ids  = [data.aws_security_group.default.id]

  # VPC Endpoint for ECR DKR
  enable_ecr_dkr_endpoint              = false
  ecr_dkr_endpoint_private_dns_enabled = false
  ecr_dkr_endpoint_security_group_ids  = [data.aws_security_group.default.id]


  tags = {
    Organization                                  = title(var.organization)
    Environment                                   = title(var.environment)
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = "1"
  }
}
