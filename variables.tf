variable "region" {
  description = "The AWS region to deploy in"
  default     = "eu-west-3"  # Change this to your preferred region
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16" # You can change this to adjust your VPC size
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"] # You can modify these to fit your needs
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"] # Adjust these as needed
}

