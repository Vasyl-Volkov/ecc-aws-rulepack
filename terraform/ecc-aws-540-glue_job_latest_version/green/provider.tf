terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4"
    }
  }
} 

provider "aws"{
  profile = var.profile
  region = var.default-region  
  default_tags {
    tags = {
      CustodianRule    = "ecc-aws-540-glue_job_latest_version"
      ComplianceStatus = "Green"
    }
  }
}
