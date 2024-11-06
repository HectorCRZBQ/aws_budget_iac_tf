variable "subscriber_email" {
  description = "Email del suscriptor para recibir notificaciones"
  type        = string
}

resource "aws_budgets_budget" "ec2" {
  name              = "budget-ec2-monthly"
  budget_type       = "COST"
  limit_amount      = "25"   # Límite de presupuesto total
  limit_unit        = "USD"
  time_period_end   = "2087-06-15_00:00"
  time_period_start = "2017-07-01_00:00"
  time_unit         = "MONTHLY"

  cost_filter {
    name = "Service"
    values = [
      "Amazon Elastic Compute Cloud - Compute",
    ]
  }

  # Alerta al alcanzar $5
  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 5
    threshold_type             = "ABSOLUTE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = [var.subscriber_email]
  }

  # Alerta al alcanzar $10
  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 10
    threshold_type             = "ABSOLUTE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = [var.subscriber_email]
  }

  # Alerta al alcanzar $15
  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 15
    threshold_type             = "ABSOLUTE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = [var.subscriber_email]
  }

  # Alerta al alcanzar $20
  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 20
    threshold_type             = "ABSOLUTE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = [var.subscriber_email]
  }

  # Alerta al alcanzar $25
  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 25
    threshold_type             = "ABSOLUTE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = [var.subscriber_email]
  }

  tags = {
    Tag1 = "Value1"
    Tag2 = "Value2"
  }
}
