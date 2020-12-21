variable "region" {
    type = string
    default = "us-east-2"
}

variable "check_acm_certificate_expiration_check" {
    type = bool
    default = true
}

variable "acm_days_to_expiration" {
    type = number
    default = 14
}

variable "config_name" {
    type = string
    default = "aws-config"
}

variable "config_logs_bucket" {
  description = "The S3 bucket for AWS Config logs."
  type        = string
  default     = "aws-config-bucket-evolvecyber"
}

variable "config_sns_topic_arn" {
    type      = string
    default   = "aws-config"
}

variable "include_global_resource_types" {
    type      = bool
    default   = true
}