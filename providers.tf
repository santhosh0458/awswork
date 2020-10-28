//provider "aws" {
//  profile = var.profile
//  region  = "us-east-1"
//  alias   = "region-master"
//}
//provider "aws" {
//  region  = "us-east-2"
//  alias   = "oh"
//  profile = "aws_account_profile"
//}

provider "aws" {
  region  = "us-east-1"
  alias   = "va"
}
