environment = "non-prod"
region = "ap-southeast-1"
owner = "tech-department"
business_division = "jio-health"

vpc_cidr_block = "10.0.0.0/16"
vpc_public_subnets = ["10.0.101.0/24", "10.0.102.0/24"]
vpc_private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
vpc_database_subnets = ["10.0.151.0/24", "10.0.152.0/24"]
vpc_create_database_subnet_group = true
vpc_create_database_subnet_route_table = true
vpc_enable_nat_gateway = true
vpc_single_nat_gateway = true
vpc_enable_dns_hostnames = true
vpc_enable_dns_support = true

instance_type = "t2.micro"
instance_keypair = "terraform-key"

cluster_version = "1.23"
cluster_service_ipv4_cidr = "172.20.0.0/16"
cluster_endpoint_private_access = false
cluster_endpoint_public_access = false
cluster_endpoint_public_access_cidrs = ["0.0.0.0/0"]
cluster_ssh_key = "eks-cluster-ssh-key"
