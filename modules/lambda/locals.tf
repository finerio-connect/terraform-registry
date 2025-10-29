locals {
  # Core
  function_name              = "${var.service_name}-${var.function_name}-${var.env}"
  description                = var.description
  service_name               = var.service_name
  local_existing_package     = var.local_existing_package
  handler                    = var.handler
  create_lambda_function_url = var.create_lambda_function_url
  # Runtime
  runtime       = var.runtime
  memory_size   = var.memory_size
  architectures = var.architectures
  timeout       = var.timeout
  # Source code
  create_layer            = var.create_layer
  create_package          = var.create_package
  ignore_source_code_hash = var.ignore_source_code_hash
  # Logs
  cloudwatch_logs_retention = {
    default = {
      cloudwatch_logs_retention_in_days = var.cloudwatch_logs_retention_in_days
    },
    staging = {
      cloudwatch_logs_retention_in_days = 30
    },
    prod = {
      cloudwatch_logs_retention_in_days = 1096
    }
  }
  attach_create_log_group_permission = var.attach_create_log_group_permission
  use_existing_cloudwatch_log_group  = var.use_existing_cloudwatch_log_group
  environment = {
    variables = merge({
      LOG_LEVEL                     = var.log_level
      POWERTOOLS_LOGGER_SAMPLE_RATE = var.log_sample_rate
      POWERTOOLS_LOGGER_LOG_EVENT   = var.log_event
      POWERTOOLS_SERVICE_NAME       = var.service_name
      POWERTOOLS_PARAMETERS_MAX_AGE = var.parameters_cache_ttl
      },
      var.environment_variables
    )
  }
  layers            = var.layers
  policy_statements = var.policy_statements
  # events
  event_source_mapping = var.event_source_mapping
  allowed_triggers     = var.allowed_triggers
}
