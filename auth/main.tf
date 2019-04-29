module "auth" {
  source        = "../module"
  service_name  = "auth"
  instance_type = "t2.micro"
  desired_count = "1"
  min_size      = "1"
  max_size      = "2"
}

