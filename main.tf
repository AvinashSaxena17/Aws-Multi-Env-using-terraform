module "dev-infra" {
    source = "./terraform_infra"
    env = "dev"
    ami = "ami-0e35ddab05955cf57"
    instance_type = "t2.micro"
    instance_count = 2
   
  
}

module "stg-infra" {
    source = "./terraform_infra"
    env = "stg"
    ami = "ami-0e35ddab05955cf57"
    instance_type = "t2.nano"
    instance_count = 2
    
  
}

module "prod-infra" {
    source = "./terraform_infra"
    env = "prod"
    ami = "ami-0e35ddab05955cf57"
    instance_type = "t2.micro"
    instance_count = 2
    
  
}
