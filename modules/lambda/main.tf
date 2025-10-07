module "lambda_module" {
  source                                  = "terraform-aws-modules/lambda/aws"
  version                                 = "7.20.2"
  function_name                           = local.lambda_name
  description                             = local.lambda_description
  handler                                 = local.lambda_handler
  runtime                                 = local.lambda_runtime
  timeout                                 = local.lambda_runtime_timeout
  architectures                           = local.lambda_runtime_architecture
  create_layer                            = local.lambda_create_layer
  create_package                          = local.lambda_create_package
  ignore_source_code_hash                 = local.lambda_ignore_source_code_hash
  local_existing_package                  = local.lambda_source_code_package_path
  layers                                  = local.lambda_layers
  environment_variables                   = local.environment.variables
  cloudwatch_logs_retention_in_days       = try(local.config_common[var.env], local.config_common.default).cloudwatch_logs_retention_in_days
  memory_size                             = local.lambda_runtime_memory
  use_existing_cloudwatch_log_group       = local.lambda_use_existing_cloudwatch_log_group
  attach_create_log_group_permission      = local.lambda_attach_create_log_group_permission
  role_name                               = "${var.lambda_service_name}-${var.lambda_name}-${random_string.data_random.result}-${var.env}"
  policy_name                             = "${var.lambda_service_name}-${var.lambda_name}-${random_string.data_random.result}-${var.env}"
  policy_statements                       = local.lambda_policy_statements
  event_source_mapping                    = local.lambda_event_source_mapping
  attach_policy_statements                = length(keys(local.lambda_policy_statements)) > 0 ? true : false
  tracing_mode                            = "Active"
  attach_tracing_policy                   = true
  allowed_triggers                        = local.allowed_triggers
  create_current_version_allowed_triggers = false
  create_lambda_function_url              = local.lambda_create_lambda_function_url
}

resource "random_string" "data_random" {
  length  = 5
  special = false
}
