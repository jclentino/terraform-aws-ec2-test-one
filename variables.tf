variable "region" {
  description = "Región AWS"
  type        = string
}

variable "ami_id" {
  description = "AMI de la instancia"
  type        = string
}

variable "instance_type" {
  description = "Tipo de instancia EC2"
  type        = string
  default     = "t3.micro"
}