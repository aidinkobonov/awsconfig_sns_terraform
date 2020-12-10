variable "check_acm_certificate_expiration_check" {
    type = bool
}

variable "acm_days_to_expiration" {
    type = number
}

variable "config_sns_topic_arn" {
    type = null
}