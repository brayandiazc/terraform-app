# Glosario

Vocabulario compartido de Terraform e infraestructura como código. Definiciones
cortas y sin ambigüedad para usar los términos de la misma forma.

| Término               | Definición                                                                                     |
| --------------------- | ---------------------------------------------------------------------------------------------- |
| **Apply**             | Fase que ejecuta los cambios y crea/actualiza los recursos reales (`terraform apply`).         |
| **Backend**           | Dónde se almacena el estado (local por defecto; remoto en S3, Terraform Cloud, etc.).          |
| **Data source**       | Bloque `data` que consulta información existente sin crearla.                                   |
| **Destroy**           | Fase que elimina todos los recursos gestionados (`terraform destroy`).                         |
| **Drift**             | Desincronización entre el estado registrado y la infraestructura real.                         |
| **HCL**               | HashiCorp Configuration Language, la sintaxis de los archivos `.tf`.                            |
| **IaC**               | Infraestructura como Código: definir infraestructura en archivos versionables.                 |
| **Init**              | Fase que prepara el directorio y descarga providers y módulos (`terraform init`).              |
| **Lock file**         | `.terraform.lock.hcl`; fija las versiones y hashes de los providers. Se versiona.              |
| **Module**            | Agrupación reutilizable de recursos (`module`).                                                 |
| **Output**            | Valor de salida expuesto por la configuración (`output`).                                       |
| **Plan**              | Fase que muestra los cambios previstos sin aplicarlos (`terraform plan`).                       |
| **Provider**          | Plugin que traduce la configuración a llamadas a la API de un servicio (AWS, Docker, local…).  |
| **Resource**          | Objeto de infraestructura gestionado por Terraform (`resource`).                               |
| **State**             | `terraform.tfstate`; registra el estado actual de la infraestructura gestionada.               |
| **Variable**          | Entrada parametrizable de la configuración (`variable`).                                        |

> Convención: mantén los términos ordenados alfabéticamente y enlaza al documento
> donde se detalla cada concepto cuando aplique (ver [`reference/`](reference/README.md)).
