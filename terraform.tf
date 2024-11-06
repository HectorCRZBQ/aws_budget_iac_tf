# Inicialización de Terraform
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  # Backend (si se necesita)
  # backend "s3" {
  #   bucket = "nombre-del-bucket"
  #   key    = "ruta/al/estado/terraform.tfstate"
  #   region = "us-west-2"
  # }
}
