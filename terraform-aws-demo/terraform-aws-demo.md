# Terraform: EC2 + S3 + RDS + Outputs + Archivo local

## Estructura de archivos

```
terraform-aws-demo/
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars  # (opcional)
```

## 1. `variables.tf`

```hcl
variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "key_name" {
  description = "Nombre del key pair de EC2"
  type        = string
}

variable "db_username" {
  description = "Usuario admin del RDS"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Contraseña del RDS"
  type        = string
  sensitive   = true
}
```

## 2. `main.tf`

```hcl
provider "aws" {
  region = var.region
}

resource "random_id" "sufijo" {
  byte_length = 4
}

# Security group para permitir acceso SSH y PostgreSQL (5432)
resource "aws_security_group" "acceso_basico" {
  name        = "acceso_basico"
  description = "Permitir SSH y PostgreSQL"
  ingress = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
  egress = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

# EC2 instance
resource "aws_instance" "mi_ec2" {
  ami           = "ami-0c6ebb5b9bce4ba15"
  instance_type = "t2.micro"
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.acceso_basico.id]
  tags = {
    Name = "ec2-terraform-demo"
  }
}

# S3 bucket
resource "aws_s3_bucket" "mi_bucket" {
  bucket        = "mi-bucket-terraform-demo-${random_id.sufijo.hex}"
  force_destroy = true
  tags = {
    Name = "s3-terraform-demo"
  }
}

# RDS (PostgreSQL)
resource "aws_db_instance" "mi_rds" {
  identifier              = "rds-terraform-demo-${random_id.sufijo.hex}"
  allocated_storage       = 20
  engine                  = "postgres"
  engine_version          = "14.11"
  instance_class          = "db.t3.micro"
  username                = var.db_username
  password                = var.db_password
  db_name                 = "demodb"
  publicly_accessible     = true
  skip_final_snapshot     = true
  vpc_security_group_ids  = [aws_security_group.acceso_basico.id]
  tags = {
    Name = "rds-terraform-demo"
  }
}

# Archivo local con información clave
resource "local_file" "info_aws_demo" {
  filename = "${path.module}/info_aws_demo.txt"
  content  = <<EOT
EC2 IP: ${aws_instance.mi_ec2.public_ip}
S3 bucket: ${aws_s3_bucket.mi_bucket.bucket}
RDS endpoint: ${aws_db_instance.mi_rds.address}
Usuario RDS: ${var.db_username}
Base de datos: demodb
EOT
}
```

## 3. `outputs.tf`

```hcl
output "ec2_public_ip" {
  description = "La IP pública de la instancia EC2"
  value       = aws_instance.mi_ec2.public_ip
}

output "s3_bucket_name" {
  description = "Nombre del bucket S3 creado"
  value       = aws_s3_bucket.mi_bucket.bucket
}

output "rds_endpoint" {
  description = "Endpoint del RDS"
  value       = aws_db_instance.mi_rds.address
}

output "rds_db_name" {
  description = "Nombre de la base de datos en RDS"
  value       = aws_db_instance.mi_rds.db_name
}

output "ec2_ssh_connection" {
  description = "Comando para conectarse por SSH a la EC2"
  value       = "ssh -i ~/.ssh/${var.key_name}.pem ec2-user@${aws_instance.mi_ec2.public_ip}"
}
```

## 4. `terraform.tfvars`

```hcl
key_name    = "TU_KEY_NAME"
region      = "us-east-1"
db_password = "PasswordSegura123!"
```

_(Nunca subas este archivo a un repo público)_

## 5. Comandos de ejecución

```bash
terraform init
terraform plan
terraform apply
```

_(Confirma con `yes`)_

## 6. ¿Qué obtienes?

- **EC2:** Instancia básica lista para pruebas (puedes conectarte por SSH).
- **S3:** Un bucket único y vacío.
- **RDS:** PostgreSQL accesible, con usuario y contraseña definidos.
- **Archivo `info_aws_demo.txt`:** Información de conexión rápida para tu laboratorio.
- **Outputs en pantalla:** Todo lo esencial (IP, bucket, endpoint).

## 7. Destruir todo

```bash
terraform destroy
```

_(Confirma con `yes` y listo. Todo se borra)_

¿Quieres personalizar algo más? ¿Te preparo una variante para MySQL, acceso privado o con VPC?
¿O lo dejamos así para demo rápida y segura?
