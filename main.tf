module "config" {
  source  = "trussworks/config/aws"
  version = "4.1.0"
  
  config_name                            = var.config_name
  config_logs_bucket                     = var.config_logs_bucket
  check_acm_certificate_expiration_check = var.check_acm_certificate_expiration_check
  acm_days_to_expiration                 = var.acm_days_to_expiration
  config_sns_topic_arn                   = aws_sns_topic.config.arn

}