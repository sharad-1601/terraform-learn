resource "aws_s3_bucket" "backend_bucket" {
  bucket =  "sharad-remote-backend-s3"


  tags = {
    "Name" = "sharad-remote-backend-s3"
    Enviroment = "dev"
  }
}
