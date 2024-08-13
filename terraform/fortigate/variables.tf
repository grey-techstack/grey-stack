variable "prefix" {
  default = "tech"
}

variable "project" {
  default = "self-host"
}

variable "contact" {
  default = "tech@sample.com"
}

variable "apitoken" {
  description = "token from Fortigate RestAPI-apiuser"
  sensitive   = true
}