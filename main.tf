module "config" {
  source  = "trussworks/config/aws"
  version = "4.1.0"
  
  check_acm_certificate_expiration_check = true
  acm_days_to_expiration = 14
 # config_sns_topic_arn = null
}