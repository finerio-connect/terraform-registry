module "lambda_module" {
  source                                  = "terraform-aws-modules/lambda/aws"
  version                                 = "8.1.2"
  function_name                           = local.function_name
  description                             = local.description
  handler                                 = local.handler
  runtime                                 = local.runtime
  timeout                                 = local.timeout
  architectures                           = local.architectures
  create_layer                            = local.create_layer
  create_package                          = local.create_package
  ignore_source_code_hash                 = local.ignore_source_code_hash
  local_existing_package                  = local.local_existing_package
  layers                                  = local.layers
  environment_variables                   = local.environment.variables
  cloudwatch_logs_retention_in_days       = try(local.cloudwatch_logs_retention[var.env], local.cloudwatch_logs_retention.default).cloudwatch_logs_retention_in_days
  memory_size                             = local.memory_size
  use_existing_cloudwatch_log_group       = local.use_existing_cloudwatch_log_group
  attach_create_log_group_permission      = local.attach_create_log_group_permission
  role_name                               = "${var.service_name}-${var.function_name}-${random_string.data_random.result}-${var.env}"
  policy_name                             = "${var.service_name}-${var.function_name}-${random_string.data_random.result}-${var.env}"
  policy_statements                       = local.policy_statements
  event_source_mapping                    = local.event_source_mapping
  attach_policy_statements                = length(keys(local.policy_statements)) > 0 ? true : false
  tracing_mode                            = "Active"
  attach_tracing_policy                   = true
  allowed_triggers                        = local.allowed_triggers
  create_current_version_allowed_triggers = false
  create_lambda_function_url              = local.create_lambda_function_url
}

resource "random_string" "data_random" {
  length  = 5
  special = false
}
