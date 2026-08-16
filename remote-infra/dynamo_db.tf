resource "aws_dynamodb_table" "backend_table" {
  name             = "remote_backend_table"
  hash_key         = "LockID"
  billing_mode     = "PAY_PER_REQUEST"


  attribute {
    name = "LockID"
    type = "S"
  }
  
  tags ={
    Name = "remote_backend_table"
  }

}
