resource "aws_s3_bucket" "infra_bucket" {
  bucket = "${var.env}-aws-demo-multi_infra-bucket"

  tags = {
    Name = "${var.env}-multi_infra"
    
  }
}
