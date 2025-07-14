# Ejercicio 1: Gestiona un archivo HTML local con Terraform

## Etapa 1: Creación

### Paso 0. Pre-requisitos

- Tener **Terraform** instalado (`terraform -v`)
- Tener **git** instalado (opcional, pero recomendado)
- Un editor de texto (VSCode, Sublime, Nano, etc.)

### Paso 1. Crear el directorio del proyecto y entrar

```bash
mkdir terraform-html-demo
cd terraform-html-demo
```

### Paso 2. Inicializar un nuevo proyecto de Terraform

Esto descarga los providers y crea los archivos iniciales.

```bash
terraform init
```

> Si no tienes un archivo `.tf` todavía, Terraform te lo dirá. No pasa nada, seguimos.

### Paso 3. Crear el archivo principal de configuración

Crea un archivo llamado `main.tf`:

```bash
touch main.tf
```

### Paso 4. Escribir el recurso para crear el archivo HTML

Abre `main.tf` y agrega este bloque:

```hcl
resource "local_file" "home" {
  filename = "${path.module}/archivo.html"
  content  = <<EOF
<!DOCTYPE html>
<html>
<head>
  <title>Mi Home</title>
</head>
<body>
  <h1>¡Hola, mundo!</h1>
  <p>Bienvenido a mi página principal.</p>
</body>
</html>
EOF
}
```

### Paso 5. Inicializar (por si acaso) para bajar el provider local

```bash
terraform init
```

### Paso 6. Revisar qué va a pasar (terraform plan)

```bash
terraform plan
```

Esto te dirá que **creará** un archivo `archivo.html` con el contenido especificado.

### Paso 7. Aplicar los cambios (crear el archivo HTML)

```bash
terraform apply
```

- Terraform te mostrará el plan de nuevo y te pedirá confirmación.
- Escribe `yes` y presiona Enter.

### Paso 8. Verifica el resultado

Abre el archivo `archivo.html` en tu editor de texto o en un navegador:

```bash
cat archivo.html
# O bien ábrelo con el editor de tu preferencia
```

### ¿Qué hiciste hasta aquí?

- Creaste un proyecto de Terraform.
- Escribiste un recurso para gestionar un archivo local.
- Ejecutaste el ciclo: escribir, planificar, aplicar.
- El archivo se creó automáticamente.

## Etapa 2: Modificación y "renombrado"

### Paso 1. Agrega un segundo recurso para `index.html`

Edita tu archivo `main.tf` para que quede así:

```hcl
resource "local_file" "home" {
  filename = "${path.module}/archivo.html"
  content  = <<EOF
<!DOCTYPE html>
<html>
<head>
  <title>Mi Home</title>
</head>
<body>
  <h1>¡Hola, mundo!</h1>
  <p>Bienvenido a mi página principal.</p>
</body>
</html>
EOF
}

resource "local_file" "home_index" {
  filename = "${path.module}/index.html"
  content  = local_file.home.content
  depends_on = [local_file.home]
}
```

### Paso 2. Ejecuta `terraform apply` para crear ambos archivos

```bash
terraform apply
```

- Se crearán **dos archivos**: `archivo.html` y `index.html`.

### Paso 3. Elimina el recurso anterior para simular el "renombrado"

- Elimina el bloque del primer recurso (`local_file.home`) de tu `main.tf`, dejando **solo** el de `index.html` (`local_file.home_index`):

```hcl
resource "local_file" "home_index" {
  filename = "${path.module}/index.html"
  content  = <<EOF
<!DOCTYPE html>
<html>
<head>
  <title>Mi Home</title>
</head>
<body>
  <h1>¡Hola, mundo!</h1>
  <p>Bienvenido a mi página principal.</p>
</body>
</html>
EOF
}
```

### Paso 4. Aplica los cambios de nuevo

```bash
terraform apply
```

- Terraform detectará que **ya no existe el recurso `archivo.html`** y lo eliminará.
- Quedará **solo** el archivo `index.html`.

### Paso 5. Verifica

```bash
ls
# Debes ver solo 'index.html' y los archivos de Terraform
cat index.html
```

**Resumen del paso:**

- Simulaste el "rename" de un archivo gestionado por Terraform.
- Entendiste cómo funciona el ciclo de vida de recursos en IaC: si eliminas el recurso de la config, Terraform lo destruye.

¡Entendido! Mantengo el formato y lo adapto a la **Etapa 3: Agregar variables**, con pasos bien marcados y explicación simple pero precisa.

## Etapa 3: Agregar variables

### Paso 1. Crear archivo de variables

Crea un archivo llamado `variables.tf` y agrega:

```hcl
variable "saludo" {
  description = "Saludo personalizado para la Home"
  type        = string
  default     = "¡Hola, mundo!"
}
```

### Paso 2. Modificar el recurso para usar la variable en el HTML

En tu archivo `main.tf`, reemplaza el contenido anterior del recurso por lo siguiente:

```hcl
resource "local_file" "home_index" {
  filename = "${path.module}/index.html"
  content  = <<EOF
<!DOCTYPE html>
<html>
<head>
  <title>Mi Home</title>
</head>
<body>
  <h1>${var.saludo}</h1>
  <p>Bienvenido a mi página principal.</p>
</body>
</html>
EOF
}
```

### Paso 3. (Opcional) Definir el valor de la variable

Puedes sobrescribir el valor por defecto de varias formas:

**A. Usando archivo `terraform.tfvars`:**

Crea el archivo:

```hcl
saludo = "¡Bienvenido, Brayan y estudiantes!"
```

**B. O usando la línea de comandos:**

```bash
terraform apply -var="saludo=¡Bienvenida generación Terraform!"
```

### Paso 4. Aplicar los cambios

Ejecuta:

```bash
terraform apply
```

- Se te mostrará el nuevo plan y deberás confirmar con `yes`.
- El archivo `index.html` se actualizará con el nuevo saludo.

### Paso 5. Verificar el resultado

Visualiza el contenido actualizado:

```bash
cat index.html
```

- El `<h1>` ahora mostrará el saludo personalizado.

**¡Listo!**
Has aprendido a usar variables en Terraform para parametrizar el contenido de los recursos.

¡Vamos entonces con la última parte, manteniendo la misma estructura y claridad!

## Etapa 4: Destruir el recurso

### Paso 1. Ejecutar el comando de destrucción

Terraform permite eliminar todos los recursos definidos en tu configuración con un solo comando:

```bash
terraform destroy
```

- Se te mostrará el plan de destrucción y deberás confirmar escribiendo `yes`.

### Paso 2. Confirmar la eliminación

Verifica que el archivo `index.html` ya no existe en tu carpeta:

```bash
ls
```

- Deberías ver que `index.html` ha desaparecido (y cualquier otro recurso gestionado por Terraform en este proyecto).

### Paso 3. Revisar el estado final

Si quieres ver el estado de Terraform después de destruir, puedes revisar los archivos internos:

```bash
cat terraform.tfstate
```

- Verás que ya no hay recursos activos registrados en el estado.

**¡Listo!**
Con esto cierras el ciclo completo de Terraform en local:
**crear → modificar → parametrizar → destruir**.
