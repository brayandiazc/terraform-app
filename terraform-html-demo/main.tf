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
