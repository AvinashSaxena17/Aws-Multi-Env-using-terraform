module "dev-infra" {
    source = "./aws_infra"
    env = "dev"
    ami = "ami-0e35ddab05955cf57"
    instance_type = "t2.micro"
    instance_count = 2
   
  
}

module "stg-infra" {
    source = "./aws_infra"
    env = "stg"
    ami = "ami-0e35ddab05955cf57"
    instance_type = "t2.nano"
    instance_count = 2
    
  
}

module "prod-infra" {
    source = "./aws_infra"
    env = "prod"
    ami = "ami-0e35ddab05955cf57"
    instance_type = "t2.micro"
    instance_count = 2
    
  
}
