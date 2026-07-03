# Stack Tecnológico

> Fuente de verdad de las herramientas, versiones y providers usados en este
> repositorio.
> **Última actualización**: 2026-07-02

## Herramientas base

| Categoría         | Tecnología                  | Versión      | Por qué                                    |
| ----------------- | --------------------------- | ------------ | ------------------------------------------ |
| IaC               | Terraform CLI               | >= 1.0.0     | Núcleo del proyecto: infraestructura como código. |
| Lenguaje          | HCL (HashiCorp Config Lang) | —            | Sintaxis declarativa de Terraform.         |
| Documentación     | Markdown                    | —            | Toda la documentación y las guías.         |
| CI                | GitHub Actions              | —            | `fmt -check` y `validate` en cada push/PR. |

## Providers por demo

| Demo                    | Provider              | Fuente                          | Versión  |
| ----------------------- | --------------------- | ------------------------------- | -------- |
| `terraform-html-demo`   | `local`               | `hashicorp/local`               | 2.5.3    |
| `terraform-docker-demo` | `docker`              | `kreuzwerker/docker`            | 3.6.2    |
| `terraform-aws-demo`    | `aws`, `random`, `local` | `hashicorp/aws`, `hashicorp/random` | (guía)   |

> Las versiones de `html` y `docker` están fijadas en sus respectivos
> `.terraform.lock.hcl`. La demo de AWS es una guía de referencia y no incluye
> archivos `.tf` versionados.

## Herramientas locales recomendadas

| Categoría    | Herramienta         | Uso                                             |
| ------------ | ------------------- | ----------------------------------------------- |
| Formato      | `terraform fmt`     | Formatear el HCL con estilo estándar.           |
| Validación   | `terraform validate`| Verificar sintaxis y consistencia.             |
| Linting      | `tflint` (opcional) | Reglas adicionales y buenas prácticas.          |
| Contenedores | Docker              | Requerido para `terraform-docker-demo`.         |
| Nube         | Cuenta AWS + CLI    | Requerido solo para `terraform-aws-demo`.       |

## Versiones mínimas soportadas

- Terraform CLI >= 1.0.0
- Docker (solo para la demo de Docker) >= 20.x
- AWS CLI (solo para la demo de AWS) >= 2.x

## Referencias

- [`../reference/terraform-basics.md`](../reference/terraform-basics.md) — conceptos.
- [Registro de providers de Terraform](https://registry.terraform.io/)
