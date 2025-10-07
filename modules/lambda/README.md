# AWS Lambda Module

Modulo generico para desplegar funciones AWS Lambda empaquetadas como archivos ZIP, con soporte para publicar versiones, administrar variables de entorno y crear el grupo de logs administrado opcionalmente.

## Caracteristicas
- Configuracion de runtime, memoria, timeout y versionado (`publish`).
- Calcula el `source_code_hash` automaticamente si no se proporciona.
- Crea y protege un `aws_cloudwatch_log_group` cuando se requiere.
- Expone ARN, nombre y version mas reciente como salidas.

## Requisitos
- Terraform >= 1.3.0.
- Provider AWS >= 4.0.
- Rol IAM existente con permisos para ejecutar la funcion.

## Uso basico

```hcl
module "lambda_app" {
  source = "git::ssh://git@github.com/finerio/terraform-registry.git//modules/lambda?ref=v0.1.0"

  function_name = "mi-funcion"
  handler       = "index.handler"
  runtime       = "python3.11"
  role_arn      = aws_iam_role.lambda_exec.arn
  source_path   = "${path.module}/../artifacts/lambda.zip"

  environment_variables = {
    STAGE = var.environment
  }
}
```

> Ajusta `ref` segun la version etiquetada que consumas desde el registro.

## Variables principales

- `function_name` (string, requerido): Nombre unico de la funcion Lambda.
- `handler` (string, requerido): Metodo handler principal del paquete.
- `runtime` (string, requerido): Runtime soportado por AWS (p.ej. `python3.11`).
- `role_arn` (string, requerido): ARN del rol IAM asociado.
- `source_path` (string, requerido): Ruta al archivo ZIP que contiene el codigo.
- `source_code_hash` (string, opcional): Hash base64 del ZIP para forzar despliegues.
- `timeout`, `memory_size`, `publish` (opcionales): Parametros de ejecucion.
- `environment_variables` (map(string), opcional): Variables de entorno.
- `create_log_group` (bool) y `log_retention_in_days` (number): Gestion de logs.

Consulta `variables.tf` para ver el catalogo completo y valores por defecto.

## Salidas

- `function_name`: Nombre final de la Lambda.
- `function_arn`: ARN asignado.
- `latest_version`: Version publicada mas reciente.

## Buenas practicas sugeridas
- Empaquetar la Lambda con dependencias en un ZIP y versionarlo externamente.
- Gestionar permisos y politicas del rol IAM desde un modulo dedicado.
- Ejecutar `terraform fmt` y `terraform validate` antes de publicar cambios.
