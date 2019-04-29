module "watermarker" {
  source        = "../module"
  service_name  = "watermarker"
  instance_type = "t2.micro"
  desired_count = "2"
  min_size      = "2"
  max_size      = "4"
}
