# Ejercicio 2: Gestionar contenedores Docker con Terraform

## Pre-requisitos

- **Docker instalado y corriendo**

  - Verifica con: `docker version`

- **Terraform instalado**

  - Verifica con: `terraform version`

## Etapa 1: Crear el proyecto

### Paso 1. Crear el directorio del proyecto y entrar

```bash
mkdir terraform-docker-demo
cd terraform-docker-demo
```

### Paso 2. Inicializar el proyecto Terraform

```bash
terraform init
```

_(Esto puedes hacerlo después de tener tu archivo `.tf` listo, pero nunca sobra hacerlo al inicio)_

## Etapa 2: Crear un contenedor Docker

### Paso 1. Crear archivo principal de configuración

Crea un archivo `main.tf` con este contenido:

```hcl
provider "docker" {}

resource "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_container" "web" {
  name  = "nginx-web"
  image = docker_image.nginx.latest
  ports {
    internal = 80
    external = 8080
  }
}
```

**¿Qué hace esto?**

- Descarga la imagen de nginx
- Crea un contenedor llamado `nginx-web`
- Expone el puerto 8080 en tu máquina, mapeado al 80 interno del contenedor

### Paso 2. Inicializa y revisa el plan

```bash
terraform init
terraform plan
```

### Paso 3. Aplica los cambios para crear el contenedor

```bash
terraform apply
```

- Escribe `yes` para confirmar.

### Paso 4. Verifica que el contenedor esté corriendo

```bash
docker ps
```

- Deberías ver el contenedor `nginx-web` activo.

Abre tu navegador y entra a:
[http://localhost:8080](http://localhost:8080)
Deberías ver la página de bienvenida de Nginx.

## Etapa 3: Modificar el contenedor

### Paso 1. Cambiar una propiedad (ejemplo: nombre del contenedor o variable de entorno)

Supón que ahora quieres agregar una variable de entorno personalizada o cambiar el nombre.

Edita el bloque de `docker_container` así:

```hcl
resource "docker_container" "web" {
  name  = "nginx-modificado"
  image = docker_image.nginx.latest
  ports {
    internal = 80
    external = 8080
  }
  env = ["MI_SALUDO=¡Hola desde Terraform y Docker!"]
}
```

### Paso 2. Aplica los cambios

```bash
terraform apply
```

- Terraform destruirá el contenedor anterior y creará uno nuevo con la configuración modificada.

### Paso 3. Verifica los cambios

```bash
docker ps
```

- El contenedor debe tener el nuevo nombre (`nginx-modificado`).

Puedes entrar al contenedor para ver la variable de entorno:

```bash
docker exec -it nginx-modificado env | grep MI_SALUDO
```

## Etapa 4: Destruir el recurso

### Paso 1. Eliminar todos los recursos creados

```bash
terraform destroy
```

- Escribe `yes` para confirmar.

### Paso 2. Confirma que ya no existen contenedores

```bash
docker ps
```

- No debe aparecer ninguno creado por este ejercicio.
