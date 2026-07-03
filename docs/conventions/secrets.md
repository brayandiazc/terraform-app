# Convenciones de secretos y estado

> Cómo gestionamos el estado de Terraform y los datos sensibles en terraform-app.
> **Última actualización**: 2026-07-02

## Filosofía

- Los secretos y el estado **nunca** se commitean.
- El estado de Terraform puede contener valores sensibles en texto plano (p. ej.
  contraseñas de RDS): trátalo como un secreto.

## Qué se versiona y qué no

| Archivo / patrón                | ¿Se versiona? | Motivo                                            |
| ------------------------------- | ------------- | ------------------------------------------------- |
| `*.tf`                          | ✅ Sí          | Es la configuración fuente.                       |
| `.terraform.lock.hcl`           | ✅ Sí          | Fija versiones de providers (reproducibilidad).   |
| `terraform.tfstate` / `.backup` | ❌ No          | Estado real; puede contener secretos.             |
| `.terraform/`                   | ❌ No          | Providers descargados y metadatos locales.        |
| `*.tfvars` / `*.tfvars.json`    | ❌ No          | Suelen contener credenciales y datos sensibles.   |
| `override.tf` / `*_override.tf` | ❌ No          | Overrides locales.                                |

> Estas reglas ya están aplicadas en el [`.gitignore`](../../.gitignore) del repo.

## Reglas

- Pasa los secretos por `variable "..." { sensitive = true }` y provéelos vía
  `*.tfvars` **no versionado** o variables de entorno `TF_VAR_*`.
- Comparte credenciales con nuevos colaboradores **fuera de banda** (nunca por
  git, email plano ni chat público).
- Si un secreto se commitea por error: **rota el secreto primero**, luego limpia
  la historia. Reescribir la historia no basta: asume que ya está comprometido.
- Para trabajo en equipo, usa **estado remoto** (S3 + DynamoDB lock, GCS o
  Terraform Cloud) con cifrado en reposo, en lugar del estado local.

## Ejemplos

```bash
# Proveer una variable sensible sin archivo (variable de entorno)
export TF_VAR_db_password="********"
terraform apply

# O con un archivo tfvars NO versionado
cp terraform.tfvars.example terraform.tfvars   # y complétalo
terraform apply -var-file=terraform.tfvars
```

## Referencias

- [`../reference/state-files.md`](../reference/state-files.md) — archivos de estado.
- [SECURITY.md](../../SECURITY.md) — política de seguridad.
- [Gestión de estado remoto — Terraform](https://developer.hashicorp.com/terraform/language/state/remote)
