variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "cluster_name" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "image_url" {
  type = string
}