# Changelog

Todos los cambios notables de este proyecto se documentan en este archivo.

El formato se basa en [Keep a Changelog](https://keepachangelog.com/es-ES/1.1.0/)
y este proyecto adhiere a [Semantic Versioning](https://semver.org/lang/es/).

## [Unreleased]

## [1.0.0] - 2026-07-02

### Added

- Estructura de gobernanza adoptada desde la plantilla `project-starter-template-es`:
  `CONTRIBUTING.md`, `CODE_OF_CONDUCT.md`, `SECURITY.md`, `CHANGELOG.md`,
  `LICENSE` (MIT) y `.editorconfig`.
- Configuración de `.github/`: plantillas de issues y PR, `FUNDING.yml`,
  `dependabot.yml` (github-actions + terraform) y `labeler.yml`.
- Workflow de CI (`ci.yml`) que ejecuta `terraform fmt -check` y
  `terraform validate` en cada push/PR.
- Documentación en `docs/`:
  - `reference/` — conceptos de Terraform (basics, comandos, sintaxis, estado),
    reubicados desde el README original.
  - `architecture/` — organización del repositorio y stack de providers.
  - `conventions/` — ciclo de vida, calidad/tooling, testing y manejo de secretos,
    adaptados a Terraform.
  - `product/roadmap.md`, `glossary.md` y `decisions/` (ADRs), incluido el
    ADR-0002 que documenta la adopción de la plantilla.

### Changed

- README reescrito como portada del proyecto siguiendo la estructura de la
  plantilla, preservando el contenido educativo en `docs/reference/`.
- `.gitignore` ampliado con reglas de sistema operativo y editores, además de las
  reglas de Terraform existentes.

### Notes

- Demos incluidas: `terraform-html-demo` (provider `local`),
  `terraform-docker-demo` (provider `docker`) y `terraform-aws-demo` (guía de
  EC2 + S3 + RDS).

<!--
Enlaces de comparación entre versiones:
[Unreleased]: https://github.com/brayandiazc/terraform-app/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/brayandiazc/terraform-app/releases/tag/v1.0.0
-->
