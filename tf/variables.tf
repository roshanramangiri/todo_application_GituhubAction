variable "name" {
  type = string
  default = "rrg-server"
  description = "Name of the project."
}


variable "ami_id" {
  type = string
  default = "ami-00874d747dde814fa"
  description = "AMI ID which is used to create a instance"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
  description = "Type of EC2 instance"
}

variable "subnet_id" {
    type = string
    default = ""
    description = "Subnet Id where our EC2 is launched"
  
}

variable "key_name" {
    type = string
    default = "roshan-auth-key"
    description = "Private key "
  
}

variable "tags" {
    default = {}
    type = map(string)
    description = "A map of tags to add all resources"
}
