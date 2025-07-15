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
