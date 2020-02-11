project           = "herkules"
component         = "kubernetes"
environment       = "shared"

vpc_cidr = "172.16.0.0/16"
private_subnet_cidrs  = ["172.16.1.0/24", "172.16.2.0/24", "172.16.3.0/24"]
public_subnet_cidrs   = ["172.16.4.0/24", "172.16.5.0/24", "172.16.6.0/24"]
database_subnet_cidrs = ["172.16.7.0/24", "172.16.8.0/24", "172.16.9.0/24"]
