module "config_logs" {
  source  = "trussworks/logs/aws"
  version = "~> 10"

  s3_bucket_name     = var.config_logs_bucket
  allow_config       = true
  config_logs_prefix = "config"
  force_destroy      = true
}

data "aws_iam_policy_document" "config" {
  statement {
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = [module.config.aws_config_role_arn]
    }
    actions   = ["SNS:Publish"]
    resources = [aws_sns_topic.config.arn]
  }
}

resource "aws_sns_topic" "config" {
  name = var.config_name
}

resource "aws_sns_topic_policy" "config" {
  arn    = aws_sns_topic.config.arn
  policy = data.aws_iam_policy_document.config.json
}

module "config" {
  source  = "trussworks/config/aws"
  version = "4.1.0"
  
  config_name                            = var.config_name
  config_logs_bucket                     = var.config_logs_bucket
  check_acm_certificate_expiration_check = var.check_acm_certificate_expiration_check
  acm_days_to_expiration                 = var.acm_days_to_expiration
  config_sns_topic_arn                   = aws_sns_topic.config.arn
}