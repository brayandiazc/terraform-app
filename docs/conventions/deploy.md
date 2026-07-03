# Convenciones de despliegue (ciclo de vida de Terraform)

> Cómo se ejecuta, actualiza y destruye la infraestructura de cada demo. Fuente de
> verdad del ciclo de vida de Terraform en este repositorio.
> **Última actualización**: 2026-07-02

## Ambientes

Este repositorio es **educativo**: cada demo se ejecuta **localmente** desde su
propia carpeta y mantiene su propio estado. No hay ambientes desplegados
(dev/staging/prod) ni deploy automático.

| Demo                    | Dónde se ejecuta   | Requiere                         |
| ----------------------- | ------------------ | -------------------------------- |
| `terraform-html-demo`   | Máquina local      | Solo Terraform                   |
| `terraform-docker-demo` | Máquina local      | Terraform + Docker corriendo     |
| `terraform-aws-demo`    | Cuenta AWS propia  | Terraform + credenciales AWS     |

## Reglas

- Ejecuta siempre desde la carpeta de la demo (cada una tiene su estado aislado).
- Revisa el `plan` **antes** de cualquier `apply`.
- El estado (`terraform.tfstate`) es local y **nunca** se versiona.
- Destruye los recursos al terminar para evitar costos (sobre todo en AWS).

## Procedimiento estándar

```bash
# 1. Entrar a la demo
cd terraform-html-demo

# 2. Inicializar (descarga providers)
terraform init

# 3. Revisar el plan
terraform plan

# 4. Aplicar (confirma con "yes")
terraform apply
```

## Rollback / limpieza

```bash
# Destruir todos los recursos de la demo (confirma con "yes")
terraform destroy
```

Para recrear un recurso concreto sin destruir todo:

```bash
terraform apply -replace='<direccion_del_recurso>'
```

## Verificación

- `terraform-html-demo`: comprueba que se generó `index.html`.
- `terraform-docker-demo`: `docker ps` debe mostrar el contenedor; abre
  <http://localhost:8080>.
- `terraform-aws-demo`: revisa los `outputs` (IP de EC2, bucket S3, endpoint RDS).

## Referencias

- [`../reference/commands.md`](../reference/commands.md) — comandos de la CLI.
- [`secrets.md`](secrets.md) — manejo de estado y credenciales.
