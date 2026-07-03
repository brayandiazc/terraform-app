# Archivos generados por Terraform y su función

> Qué archivos genera Terraform, para qué sirven y cuáles versionar.
> **Última actualización**: 2026-07-02

## 1. `terraform.tfstate`

- **¿Qué es?**
  Es el archivo **más importante** de Terraform.
  Guarda el **estado actual** de la infraestructura gestionada por Terraform.
- **¿Para qué sirve?**
  Permite que Terraform sepa qué recursos existen, sus atributos, relaciones y cambios.
  Así puede comparar el "deseado" (definido en `.tf`) vs el "real" (en la nube/local).
- **¿Qué contiene?**
  Un JSON con información detallada de todos los recursos creados, IDs, direcciones, metadatos, etc.
- **¿Qué debes saber?**
  **¡Nunca lo edites a mano!** Si lo pierdes, Terraform "olvida" la infraestructura y podrías tener problemas de drift (desincronización).
  En proyectos serios, se almacena de forma remota (ejemplo: en S3 para trabajo en equipo).

## 2. `terraform.tfstate.backup`

- **¿Qué es?**
  Es una **copia de seguridad** automática del estado anterior cada vez que Terraform modifica el estado.
- **¿Para qué sirve?**
  Si algo sale mal, puedes recuperar el estado previo y evitar pérdida o corrupción.
- **¿Qué contiene?**
  Básicamente, el contenido anterior del archivo `terraform.tfstate`.
- **¿Qué debes saber?**
  Normalmente se ignora (se pone en `.gitignore`), salvo que debas restaurar el estado.

## 3. `.terraform/` (directorio oculto)

- **¿Qué es?**
  Un directorio que contiene **los plugins descargados** (providers) y archivos internos de control.
- **¿Para qué sirve?**
  Almacena los binarios y metadatos de los providers (ej: AWS, Docker, local, etc), y archivos de lock.
- **¿Qué contiene?**

  - Subcarpetas con los providers y módulos.
  - Archivos internos como `providers`, `modules.json`.

- **¿Qué debes saber?**
  No lo toques ni lo subas al repo. Si tienes problemas con providers, puedes borrar este directorio y correr `terraform init` de nuevo.

## 4. `.terraform.lock.hcl`

- **¿Qué es?**
  Archivo de **lock** de versiones de providers (como un package-lock).
- **¿Para qué sirve?**
  Fija la versión de los providers usados para garantizar que todos trabajen con la misma versión.
- **¿Qué contiene?**
  Nombres, versiones y hashes de los providers usados en el proyecto.
- **¿Qué debes saber?**
  Es bueno **sí subirlo** al repo (control de versiones).

## ¿Qué archivos nunca subir a Git?

- `terraform.tfstate`
- `terraform.tfstate.backup`
- `.terraform/`
- Archivos `*.tfvars` con datos sensibles

**Solo sube:**

- Tus archivos `.tf`
- `.terraform.lock.hcl`

La configuración de `.gitignore` de este repositorio ya cubre estas reglas. Ver
también [`../conventions/secrets.md`](../conventions/secrets.md).

## Referencias

- [Estado de Terraform — documentación oficial](https://developer.hashicorp.com/terraform/language/state)
