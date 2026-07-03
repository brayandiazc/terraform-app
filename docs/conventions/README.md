# Convenciones

Esta carpeta documenta **cómo trabajamos** en terraform-app: reglas y estándares
transversales para escribir y operar configuración de Terraform.

> Diferencia con `docs/architecture/`: aquí van las **reglas** ("cómo validamos y
> formateamos"); en `architecture/` va **este** repositorio en concreto ("cómo se
> organizan las demos").

## Convenciones incluidas

| Convención                               | Tema                                       |
| ---------------------------------------- | ------------------------------------------ |
| [deploy.md](deploy.md)                   | Ciclo `init → plan → apply → destroy`      |
| [quality-tooling.md](quality-tooling.md) | `fmt`, `validate`, `tflint` y git hooks    |
| [secrets.md](secrets.md)                 | Estado, `*.tfvars` y manejo de secretos    |
| [testing.md](testing.md)                 | Cómo validamos la configuración            |

## Agregar una convención

Copia [`_template.md`](_template.md), renómbralo en `kebab-case` y documenta el
nuevo tema. Añádelo a la tabla de arriba.

## Convenciones adicionales opcionales

No se incluyen por defecto; créalas con `_template.md` si el proyecto las necesita.

- Estado remoto (backends S3/GCS/Terraform Cloud) y bloqueo de estado.
- Estrategia de workspaces y entornos (dev/staging/prod).
- Convenciones de nombrado y etiquetado (tags) de recursos.
- Módulos: estructura, versionado y publicación.
