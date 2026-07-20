variable "aws_region" {
  description = "AWS Region"
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project Name"
  default     = "serverless-rest-api"
}

variable "lab_role_arn" {
  description = "Sandbox Lab Role ARN"
  default     = "arn:aws:iam::YOUR_ACCOUNT_ID:role/LabRole"
}