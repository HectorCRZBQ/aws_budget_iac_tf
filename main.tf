# Invocación del módulo IAM
module "iam" {
  source      = "./iam"
  user1_name  = "hector_delacruz"
  user2_name  = "terraform"
}

# Etiquetas comunes para toda la infraestructura
locals {
  tags = {
    nombre = "Hector de la Cruz Baquero"
    iac    = "terraform"
    env    = "Automatización y despliegue"
  }
}

# Proveedor de AWS
provider "aws" {
  region = "us-east-1"
}

# Datos para obtener el Account ID actual
data "aws_caller_identity" "current" {}

# Creación del bucket S3 con un nombre dinámico
resource "aws_s3_bucket" "bucket_data" {
  bucket = "bucket-data-${data.aws_caller_identity.current.account_id}"

  tags = {
    nombre = "Hector de la Cruz Baquero"
    iac    = "terraform"
    env    = "Automatización y despliegue"
  }
}

# Recurso de presupuesto para EC2 con notificaciones
resource "aws_budgets_budget" "ec2" {
  name              = "budget-ec2-monthly"
  budget_type       = "COST"
  limit_amount      = "25"
  limit_unit        = "USD"
  time_period_end   = "2087-06-15_00:00"
  time_period_start = "2017-07-01_00:00"
  time_unit         = "MONTHLY"

  # Filtro para costos de EC2
  cost_filter {
    name = "Service"
    values = [
      "Amazon Elastic Compute Cloud - Compute",
    ]
  }

  # Notificaciones de alertas de presupuesto
  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 5
    threshold_type             = "ABSOLUTE_VALUE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = [var.subscriber_email]
  }

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 10
    threshold_type             = "ABSOLUTE_VALUE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = [var.subscriber_email]
  }

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 15
    threshold_type             = "ABSOLUTE_VALUE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = [var.subscriber_email]
  }

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 20
    threshold_type             = "ABSOLUTE_VALUE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = [var.subscriber_email]
  }

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 25
    threshold_type             = "ABSOLUTE_VALUE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = [var.subscriber_email]
  }

  # Asignación de etiquetas comunes
  tags = local.tags
}

# Configuración del backend
terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "terraform-infrastructure-619071315476"
    dynamodb_table = "terraform-state-lock"
    key            = "terraform.tfstate"
    region         = "us-east-1"
  }
}
