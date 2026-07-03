# Documentación de terraform-app

Mapa de la documentación del proyecto. Empieza por aquí para saber qué documento
responde cada pregunta.

| Documento                                                      | Pregunta que responde                | Cuándo leerlo                     |
| -------------------------------------------------------------- | ------------------------------------ | --------------------------------- |
| [`reference/`](reference/README.md)                            | ¿Qué es Terraform y cómo se usa?     | Al aprender Terraform desde cero  |
| [`architecture/architecture.md`](architecture/architecture.md) | ¿Cómo está organizado el repo?       | Al entender el panorama general   |
| [`architecture/stack.md`](architecture/stack.md)               | ¿Con qué versiones y providers?      | Al preparar el entorno            |
| [`product/roadmap.md`](product/roadmap.md)                     | ¿Hacia dónde va?                     | Para conocer prioridades          |
| [`decisions/`](decisions/README.md)                            | ¿Por qué tomamos cada decisión?      | Antes de re-debatir algo          |
| [`conventions/`](conventions/README.md)                        | ¿Cómo trabajamos en este repo?       | Antes de escribir configuración   |
| [`glossary.md`](glossary.md)                                   | ¿Qué significa cada término?         | Ante vocabulario desconocido      |

## Sobre la distinción `architecture/` vs `conventions/` vs `reference/`

- **`architecture/`** describe **este** repositorio en concreto (cómo se organizan
  las demos y qué providers usa).
- **`conventions/`** describe **reglas reusables** de cómo trabajamos con Terraform
  (formato, validación, manejo de estado y secretos).
- **`reference/`** es material conceptual sobre Terraform en general, no atado a
  este repo (qué es, comandos, sintaxis, archivos de estado).

## Cómo mantener esta documentación

- Actualiza la línea **"Última actualización"** al editar un documento.
- Registra las decisiones relevantes como [ADRs](decisions/README.md).
- Mantén este índice al día si agregas o quitas documentos.
