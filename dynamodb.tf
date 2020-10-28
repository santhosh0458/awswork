resource "aws_dynamodb_table" "EmpList" {
  name           = "EmpList"
  billing_mode   = "PROVISIONED"
  read_capacity  = 10
  write_capacity = 10
  hash_key       = "EmpId"
  range_key      = "Dept"

  attribute {
    name = "EmpId"
    type = "S"
  }

  attribute {
    name = "Dept"
    type = "S"
  }

  attribute {
    name = "EmpName"
    type = "S"
  }

  ttl {
    attribute_name = "TimeToExist"
    enabled        = false
  }

  global_secondary_index {
    name               = "DeptName"
    hash_key           = "Dept"
    range_key          = "EmpName"
    write_capacity     = 10
    read_capacity      = 10
    projection_type    = "INCLUDE"
    non_key_attributes = ["EmpId"]
  }

  tags = {
    Name        = "dynamodb-table-1"
    Environment = "production"
  }
}