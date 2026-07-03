# 0002. Adoptar la plantilla de documentación

- **Estado**: Aceptada
- **Fecha**: 2026-07-02
- **Decisores**: Brayan Diaz C

## Contexto y problema

`terraform-app` había crecido como una colección de demos de Terraform y un
README extenso con material de referencia. No tenía estructura de gobernanza
(contribución, seguridad, código de conducta, changelog) ni una organización de
documentación reutilizable. Se buscaba estandarizar el repositorio siguiendo la
plantilla [`project-starter-template-es`](https://github.com/brayandiazc/project-starter-template-es)
sin perder el contenido existente.

## Opciones consideradas

- **Mantener el estado actual** — un único README largo, sin gobernanza.
- **Copiar la plantilla completa tal cual** — incluiría muchos documentos que no
  aplican a un repositorio educativo (API, auth, base de datos, SEO, i18n…).
- **Adoptar la plantilla de forma selectiva** — traer gobernanza y estructura de
  `docs/`, borrar lo no aplicable y reubicar el contenido de Terraform.

## Decisión

Adoptamos la plantilla de forma **selectiva**:

- Se incorporan los archivos de gobernanza (`CONTRIBUTING`, `CODE_OF_CONDUCT`,
  `SECURITY`, `CHANGELOG`, `LICENSE`, `.editorconfig`) y `.github/`.
- El README se reescribe como portada siguiendo la estructura de la plantilla.
- El material conceptual de Terraform del README original se preserva en
  [`docs/reference/`](../reference/README.md).
- Se conservan de `docs/` solo `architecture`, `product`, `decisions`,
  `conventions` (adaptadas a Terraform) y `glossary`; se borran los documentos no
  aplicables (API, auth, base de datos, diseño, SEO, i18n, etc.).
- No se añade `.env.example` porque las demos no usan variables de entorno de
  aplicación.

## Consecuencias

**Positivas:**

- Gobernanza y estructura estándar, coherentes con los demás proyectos.
- El contenido educativo se conserva y queda mejor organizado.
- CI valida formato y sintaxis del HCL en cada PR.

**Negativas / costos:**

- Mantener la documentación al día requiere disciplina.

**Neutras / a vigilar:**

- Algunos documentos de gobernanza (p. ej. `SECURITY.md`) contienen prácticas
  genéricas de aplicaciones; se mantienen como referencia general.

## Referencias

- [Plantilla `project-starter-template-es`](https://github.com/brayandiazc/project-starter-template-es)
- [`TEMPLATE-USAGE.md` de la plantilla](https://github.com/brayandiazc/project-starter-template-es/blob/main/TEMPLATE-USAGE.md)
