locals {
  # Core
  lambda_name                       = "${var.lambda_service_name}-${var.lambda_name}-${var.env}"
  lambda_description                = var.lambda_description
  lambda_service_name               = var.lambda_service_name
  lambda_source_code_package_path   = var.lambda_source_code_package_path
  lambda_handler                    = var.lambda_handler
  lambda_create_lambda_function_url = var.lambda_create_lambda_function_url
  # Runtime
  lambda_runtime                  = var.lambda_runtime_engine
  lambda_runtime_memory           = var.lambda_runtime_memory
  lambda_runtime_architecture     = [var.lambda_runtime_architecture]
  lambda_runtime_timeout          = var.lambda_runtime_timeout
  # Source code
  lambda_create_layer             = var.lambda_create_package
  lambda_create_package           = var.lambda_create_package
  lambda_ignore_source_code_hash  = var.lambda_ignore_source_code_hash
  # Logs
  config_common = {
    default = {
      cloudwatch_logs_retention_in_days = var.lambda_logs_retention_in_days
    },
    staging = {
      cloudwatch_logs_retention_in_days = 30
    },
    prod = {
      cloudwatch_logs_retention_in_days = 1096
    }
  }
  lambda_attach_create_log_group_permission = true
  lambda_use_existing_cloudwatch_log_group  = false
  environment = {
    variables = merge({
      LOG_LEVEL                     = var.lambda_log_level
      POWERTOOLS_LOGGER_SAMPLE_RATE = var.lambda_log_rate
      POWERTOOLS_LOGGER_LOG_EVENT   = var.lambda_log_event
      POWERTOOLS_SERVICE_NAME       = var.lambda_service_name
      POWERTOOLS_PARAMETERS_MAX_AGE = var.lambda_cache_ssm
      },
      var.lambda_environment_variables
    )
  }
  lambda_layers               = var.lambda_layers
  lambda_policy_statements    = var.lambda_policy_statements
  # events
  lambda_event_source_mapping = var.lambda_event_source_mapping
  allowed_triggers            = var.allowed_triggers
}
