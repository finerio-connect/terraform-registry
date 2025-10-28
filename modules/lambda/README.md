# AWS Lambda Wrapper

Modulo de conveniencia para consumir el modulo publico [`terraform-aws-modules/lambda/aws`](https://github.com/terraform-aws-modules/terraform-aws-lambda) manteniendo los mismos nombres de variables que el recurso original y agregando opinionated defaults para logs y Powertools.

## Caracteristicas
- Utiliza `terraform-aws-modules/lambda/aws` en su version `8.1.2`.
- Construye automaticamente los nombres (`function_name`, `role_name`, `policy_name`) a partir de `service_name`, `function_name` y `env`.
- Inyecta variables de entorno para AWS Powertools (`LOG_LEVEL`, `POWERTOOLS_*`).
- Define retencion de logs por ambiente (`default`, `staging`, `prod`) y permite personalizarla.

## Requisitos
- Terraform >= 1.3.0.
- Provider AWS >= 4.0.

## Uso basico

```hcl
module "lambda_app" {
  source = "git::ssh://git@github.com/finerio/terraform-registry.git//modules/lambda?ref=v0.x.x"

  env          = var.env
  service_name = "payments"
  function_name = "webhook"

  description = "Procesa notificaciones entrantes"
  handler     = "app.lambda_handler"
  runtime     = "python3.11"
  timeout     = 10
  memory_size = 256

  environment_variables = {
    STAGE = var.env
  }
}
```

> Ajusta `ref` a la etiqueta que corresponda a la version deseada del registro.

## Variables principales

- `service_name` y `function_name`: Se combinan con `env` para nombrar recursos derivados.
- `description`, `handler`, `runtime`, `timeout`, `memory_size`, `architectures`: Se pasan directamente al modulo original.
- `create_package`, `create_layer`, `local_existing_package`, `layers`: Controlan el origen del codigo y capas.
- `environment_variables`: Mapa adicional fusionado con las variables Powertools generadas.
- `cloudwatch_logs_retention_in_days`: Retencion base aplicada al ambiente `default`.
- `policy_statements`, `event_source_mapping`, `allowed_triggers`: Configuraciones avanzadas heredadas del modulo original.

Revisa `variables.tf` para ver el catalogo completo, tipos y valores por defecto.

## Extender la configuracion

El wrapper expone los argumentos mas comunes del modulo oficial. Si necesitas un argumento adicional basta con agregarlo en `variables.tf`, mapearlo en `locals.tf` y referenciarlo en `main.tf`. De momento Terraform no permite pasar dinamicamente atributos arbitrarios a un bloque `module`, por lo que los nuevos parametros deben declararse explicitamente.

## Salidas

- `lambda_function_name`
- `lambda_function_arn`
- `lambda_role_name`

## Buenas practicas sugeridas
- Empaquetar la Lambda con dependencias en un ZIP y versionarlo externamente.
- Gestionar permisos y politicas IAM complementarias desde modulos dedicados.
- Ejecutar `terraform fmt` y `terraform validate` antes de publicar cambios.
