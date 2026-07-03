# Roadmap — terraform-app

> Estado y dirección del proyecto. Documento vivo.
> **Última actualización**: 2026-07-02

## Leyenda

- ✅ Hecho
- 🚧 En curso
- 📋 Planificado
- ⏸️ Diferido

## Visión

Ser una referencia práctica y progresiva para aprender Terraform en español:
desde un archivo local hasta infraestructura en la nube, con demos ejecutables y
documentación clara.

## Estado actual

- ✅ Demo local con el provider `local` (`terraform-html-demo`).
- ✅ Demo de contenedores con el provider `docker` (`terraform-docker-demo`).
- ✅ Guía de AWS (EC2 + S3 + RDS) como referencia (`terraform-aws-demo`).
- ✅ Documentación de referencia (conceptos, comandos, sintaxis, estado).
- ✅ Estructura de gobernanza y documentación adoptada desde la plantilla.

## Próximos pasos

### 📋 Cobertura de más providers

- [ ] Demo con estado remoto (backend S3 + DynamoDB lock).
- [ ] Demo con módulos reutilizables.
- [ ] Ejemplos de `data` sources y `for_each`.

### 📋 Automatización

- [ ] `tflint` en CI.
- [ ] `.tf` ejecutables (con `terraform.tfvars.example`) para la demo de AWS.

## Backlog / ideas sin agendar

- Variante de la demo de Docker con `docker compose` gestionado por Terraform.
- Traducir la referencia a inglés.

## Fuera de alcance

- No es un boilerplate de infraestructura de producción: son demos educativas.

## Cómo se actualiza este documento

- Revisar al cerrar cada versión/fase.
- Las decisiones que cambian el rumbo se registran como ADRs en
  [`../decisions/`](../decisions/README.md).
