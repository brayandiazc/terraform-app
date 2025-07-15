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
  filename   = "${path.module}/index.html"
  content    = local_file.home.content
  depends_on = [local_file.home]
}
