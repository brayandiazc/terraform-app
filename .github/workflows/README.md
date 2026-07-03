# Workflows de CI/CD

Esta carpeta contiene los workflows de [GitHub Actions](https://docs.github.com/actions)
del proyecto.

## Workflows incluidos

- [`ci.yml`](ci.yml) — valida la configuración de Terraform en cada push/PR:
  - `terraform fmt -check -recursive` — verifica el formato de todo el HCL.
  - `terraform validate` — comprueba la sintaxis de cada demo con archivos `.tf`
    (`terraform-html-demo`, `terraform-docker-demo`). No requiere credenciales de
    nube: `init` solo descarga los _providers_ y `validate` no contacta a ningún
    proveedor.

## Workflows recomendados (opcionales)

| Workflow                    | Propósito                                      |
| --------------------------- | ---------------------------------------------- |
| `labeler.yml`               | Auto-etiquetado de PRs (usa `../labeler.yml`). |
| `dependabot-auto-merge.yml` | Auto-merge de PRs de Dependabot (parches).     |

## Secrets

Define en **Settings → Secrets and variables → Actions** los secretos que
necesiten tus workflows (p. ej. credenciales de nube para un plan/apply real).
Ver [`../../docs/conventions/secrets.md`](../../docs/conventions/secrets.md).
