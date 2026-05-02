terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0"
    }
  }
  required_version = ">= 1.0"
}

resource "aws_cloudformation_stack" "oe_patterns_consuldemocracy" {
  name = var.stack_name

  template_url = "https://awsmp-cft-053155443450-1579814207723.s3.us-east-1.amazonaws.com/8c18abce-bdb4-45f6-b0cc-1e7da019d0bb/8c18abce-bdb4-45f6-b0cc-1e7da019d0bb/template.yaml"

  capabilities = ["CAPABILITY_NAMED_IAM"]

  # timeouts
  timeout_in_minutes = 120
  timeouts {
    create = "120m"
  }

  parameters = {
    AdminEmail                     = var.admin_email
    AlbCertificateArn              = var.alb_certificate_arn
    AlbIngressCidr                 = var.alb_ingress_cidr
    AsgDesiredCapacity             = var.asg_desired_capacity
    AsgDiskUsageAlarmThreshold     = var.asg_disk_usage_alarm_threshold
    AsgInstanceType                = var.asg_instance_type
    AsgKeyName                     = var.asg_key_name
    AsgMaxSize                     = var.asg_max_size
    AsgMinSize                     = var.asg_min_size
    AsgReprovisionString           = var.asg_reprovision_string
    AssetsBucketName               = var.assets_bucket_name
    DbBackupRetentionPeriod        = var.db_backup_retention_period
    DbInstanceClass                = var.db_instance_class
    DbSecretArn                    = var.db_secret_arn
    DbSnapshotIdentifier           = var.db_snapshot_identifier
    DelayedJobCount                = var.delayed_job_count
    DnsHostname                    = var.dns_hostname
    DnsRoute53HostedZoneName       = var.dns_route53_hosted_zone_name
    SesCreateDomainIdentity        = var.ses_create_domain_identity
    SesInstanceUserAccessKeySerial = var.ses_instance_user_access_key_serial
    VpcCidr                        = var.vpc_cidr
    VpcId                          = var.vpc_id
    VpcNatGatewayPerSubnet         = var.vpc_nat_gateway_per_subnet
    VpcPrivateSubnet1Cidr          = var.vpc_private_subnet1_cidr
    VpcPrivateSubnet1Id            = var.vpc_private_subnet1_id
    VpcPrivateSubnet2Cidr          = var.vpc_private_subnet2_cidr
    VpcPrivateSubnet2Id            = var.vpc_private_subnet2_id
    VpcPublicSubnet1Cidr           = var.vpc_public_subnet1_cidr
    VpcPublicSubnet1Id             = var.vpc_public_subnet1_id
    VpcPublicSubnet2Cidr           = var.vpc_public_subnet2_cidr
    VpcPublicSubnet2Id             = var.vpc_public_subnet2_id
  }
}
