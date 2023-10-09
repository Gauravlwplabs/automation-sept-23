# data "amazon-ami" "this" {
#   filters = {
#     virtualization-type = "hvm"
#     name                = "al2023-ami-*"
#     root-device-type    = "ebs"
#   }
#   owners      = ["137112412989"]
#   most_recent = true
#   region      = "us-east-1"
# }