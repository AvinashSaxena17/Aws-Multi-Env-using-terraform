module "dev-infra" {
    source = "./terraform_infra"
    env = "dev"
    ami = "ami-0e35ddab05955cf57"
    instance_type = "t2.micro"
    instance_count = 2
    bucket_name = "${var.env}-demo_bucket"
  
}

module "stg-infra" {
    source = "./terraform_infra"
    env = "stg"
    ami = "ami-0e35ddab05955cf57"
    instance_type = "t2.nano"
    instance_count = 2
    bucket_name = "${var.env}-demo_bucket"
  
}

module "prod-infra" {
    source = "./terraform_infra"
    env = "prod"
    ami = "ami-0e35ddab05955cf57"
    instance_type = "t2.micro"
    instance_count = 2
    bucket_name = "${var.env}-demo_bucket"
  
}