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
}

#variable "config_sns_topic_arn" {
#    type = null
#}