module "watermarker" {
  source        = "../module"
  service_name  = "watermarker"
  instance_type = "t2.micro"
  ami_id        = ""
  desired_count = "1"
  min_size      = "1"
  max_size      = "2"
  version       = "19.4.27"
}
