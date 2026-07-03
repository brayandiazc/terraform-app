# Convenciones de testing (validación de Terraform)

> Cómo verificamos que la configuración de Terraform es correcta antes de aplicar
> o mergear.
> **Última actualización**: 2026-07-02

## Stack

- **Formato**: `terraform fmt`.
- **Validación de sintaxis**: `terraform validate`.
- **Dry-run**: `terraform plan`.
- **Linting (opcional)**: `tflint`.

## Niveles de verificación

| Nivel        | Qué comprueba                                  | Comando                        |
| ------------ | ---------------------------------------------- | ------------------------------ |
| Formato      | Estilo consistente del HCL                     | `terraform fmt -check -recursive` |
| Sintaxis     | Configuración válida y consistente             | `terraform validate`           |
| Plan         | Qué cambiaría al aplicar (sin aplicar)         | `terraform plan`               |

## Reglas

- Todo cambio de configuración pasa `fmt` y `validate` antes del merge (CI lo
  verifica en cada PR).
- Revisa el `plan` antes de cualquier `apply`; no apliques cambios sin leerlo.
- La validación no requiere credenciales de nube: `init -backend=false` +
  `validate` descargan providers pero no contactan a ningún proveedor.

## Ejemplo (por demo)

```bash
cd terraform-html-demo
terraform fmt -check
terraform init -backend=false
terraform validate
```

## Comandos útiles

```bash
terraform fmt -recursive       # Formatear todo el repositorio
terraform validate             # Validar la demo actual
terraform plan                 # Ver los cambios previstos
```

## Referencias

- [`quality-tooling.md`](quality-tooling.md) — tooling y git hooks.
- [CI del proyecto](../../.github/workflows/ci.yml) — `fmt` + `validate` automáticos.
