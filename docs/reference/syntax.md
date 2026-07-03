# Sintaxis de Terraform (HCL)

> Referencia de la sintaxis HCL y los bloques esenciales de Terraform.
> **Última actualización**: 2026-07-02

La sintaxis de Terraform se llama **HCL (HashiCorp Configuration Language)**. Es sencilla y legible, tipo JSON pero más flexible.

## Ejemplo sencillo: crear una instancia EC2 en AWS

```hcl
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ejemplo" {
  ami           = "ami-0c6ebb5b9bce4ba15"
  instance_type = "t2.micro"
}
```

**Explicación:**

- `provider "aws"`: Configura el proveedor (qué nube usar).
- `resource "aws_instance" "ejemplo"`: Crea un recurso tipo EC2, con los parámetros indicados.
- Los valores se pueden parametrizar, interpolar, y combinar con variables y outputs.

## Bloques esenciales

| Bloque/Sintaxis     | ¿Para qué sirve?                           | Ejemplo mínimo                                                    |
| ------------------- | ------------------------------------------ | ---------------------------------------------------------------- |
| `provider`          | Configura el proveedor (cloud/local/etc)   | `provider "aws" { region = "us-east-1" }`                        |
| `resource`          | Declara un recurso a gestionar             | `resource "local_file" "ej" { filename = "x.txt" content = "Hola" }` |
| `variable`          | Define una variable reutilizable           | `variable "nombre" { type = string default = "Estudiante" }`     |
| `output`            | Expone un valor de salida                  | `output "saludo" { value = var.nombre }`                         |
| `data`              | Consulta información externa (data source) | `data "aws_ami" "ubuntu" { most_recent = true }`                 |
| `module`            | Usa un módulo reutilizable                 | `module "vpc" { source = "terraform-aws-modules/vpc/aws" }`      |
| `locals`            | Define valores locales calculados          | `locals { mensaje = "Hola, ${var.nombre}" }`                     |
| `depends_on`        | Forzar dependencias entre recursos         | `resource "x" "a" { depends_on = [resource.y.b] }`               |
| `terraform`         | Configuración de backend y versiones       | `terraform { required_version = ">= 1.0.0" }`                    |
| Interpolación `${}` | Insertar variables o expresiones           | `content = "Hola, ${var.nombre}"`                                |
| Comentario          | Documentar el código                       | `# Esto es un comentario` · `// También válido`                  |

## Referencias

- [`terraform-basics.md`](terraform-basics.md) — conceptos y ciclo de vida.
- [`commands.md`](commands.md) — comandos de la CLI.
- [Lenguaje de configuración de Terraform — documentación oficial](https://developer.hashicorp.com/terraform/language)
