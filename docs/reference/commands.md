# Comandos clave de Terraform

> Referencia rápida de los comandos de la CLI de Terraform.
> **Última actualización**: 2026-07-02

| Comando               | Descripción breve                                                   | Uso principal                                          |
| --------------------- | ------------------------------------------------------------------- | ------------------------------------------------------ |
| `terraform init`      | Inicializa el directorio de trabajo y descarga providers y módulos. | **Siempre primero**, preparar el entorno.              |
| `terraform validate`  | Valida que la configuración `.tf` sea sintácticamente correcta.     | Revisar errores antes de ejecutar cambios.             |
| `terraform fmt`       | Formatea los archivos `.tf` con estilo estándar.                    | Ordenar y limpiar el código.                           |
| `terraform plan`      | Muestra los cambios que Terraform va a realizar (previo a aplicar). | Verificar antes de aplicar cambios.                    |
| `terraform apply`     | Aplica los cambios y crea/actualiza los recursos definidos.         | Crear, modificar o actualizar infraestructura.         |
| `terraform destroy`   | Elimina todos los recursos definidos en la configuración.           | **Destruir** recursos de forma controlada.             |
| `terraform output`    | Muestra los valores de salida definidos en la configuración.        | Ver resultados o endpoints generados.                  |
| `terraform state`     | Permite inspeccionar o modificar el estado de los recursos.         | Diagnóstico avanzado o reparaciones.                   |
| `terraform show`      | Muestra el estado actual o un plan de ejecución en formato legible. | Ver resumen del estado real.                           |
| `terraform providers` | Lista los proveedores usados y sus versiones.                       | Auditoría y troubleshooting.                           |
| `terraform import`    | Añade recursos existentes fuera de Terraform al estado.             | Adoptar recursos creados manualmente.                  |
| `terraform taint`     | Marca un recurso para ser destruido y recreado en el próximo apply. | Forzar recreación.                                     |
| `terraform untaint`   | Elimina el "taint" de un recurso.                                   | Quitar marca de recreación.                            |
| `terraform graph`     | Genera un gráfico de dependencias de recursos en formato DOT.       | Visualización avanzada (usando herramientas externas). |
| `terraform version`   | Muestra la versión de Terraform instalada.                          | Verificar compatibilidad.                              |
| `terraform help`      | Muestra ayuda general o de un comando específico.                   | Consulta rápida sobre comandos.                        |

## Referencias

- [`terraform-basics.md`](terraform-basics.md) — conceptos y ciclo de vida.
- [CLI de Terraform — documentación oficial](https://developer.hashicorp.com/terraform/cli/commands)
