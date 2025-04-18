terraform {
  backend "s3" {
    bucket = "dev-cloud-bucket-2025"
    key = "backend/terraform.tfstate"
    region = "us-west-1"
    use_lockfile = true
    encrypt = true
  }
}