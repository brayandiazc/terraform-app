# Convenciones de calidad y tooling

> Formato, validación, linting y git hooks para el HCL de terraform-app.
> **Última actualización**: 2026-07-02

## Stack

- **Formateador**: `terraform fmt` (incluido en la CLI).
- **Validación**: `terraform validate`.
- **Linter (opcional)**: [`tflint`](https://github.com/terraform-linters/tflint).
- **Fijado de versiones**: `.terraform.lock.hcl` versionado por demo.

## Reglas

- El HCL debe estar formateado (`terraform fmt`) y ser válido
  (`terraform validate`) antes del merge. Son checks **bloqueantes** en CI.
- Versiona `.terraform.lock.hcl`; **no** versiones `.terraform/` ni el estado.
- Fija versiones de providers explícitamente en el bloque `required_providers`.

## Git hooks (sugerido)

Estrategia: hooks baratos y rápidos en `pre-commit`. CI vuelve a ejecutar todo.

### pre-commit

- `terraform fmt -check -recursive`
- Verificación de trailing whitespace y fin de archivo (ver `.editorconfig`).

### pre-push

- `terraform validate` en las demos con archivos `.tf`.

## Comandos útiles

```bash
terraform fmt -recursive          # Formatear todo el repositorio
terraform fmt -check -recursive   # Verificar formato (falla si algo no está formateado)
terraform validate                # Validar la configuración de la demo actual
tflint                            # Linting adicional (si está instalado)
```

## Referencias

- [`testing.md`](testing.md) — niveles de validación.
- [Documentación de `terraform fmt`](https://developer.hashicorp.com/terraform/cli/commands/fmt)
