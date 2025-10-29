module "lambda_module" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "8.1.2"

  # Creation toggles
  create                     = var.create
  create_package             = local.create_package
  create_function            = var.create_function
  create_layer               = local.create_layer
  create_role                = var.create_role
  create_lambda_function_url = local.create_lambda_function_url
  create_sam_metadata        = var.create_sam_metadata
  putin_khuylo               = var.putin_khuylo

  # Naming
  function_name = local.function_name
  description   = local.description
  handler       = local.handler

  # Runtime
  runtime                         = local.runtime
  architectures                   = local.architectures
  memory_size                     = local.memory_size
  timeout                         = local.timeout
  layers                          = local.layers
  publish                         = var.publish
  lambda_at_edge                  = var.lambda_at_edge
  lambda_at_edge_logs_all_regions = var.lambda_at_edge_logs_all_regions
  lambda_role                     = var.lambda_role
  code_signing_config_arn         = var.code_signing_config_arn
  kms_key_arn                     = var.kms_key_arn
  ephemeral_storage_size          = var.ephemeral_storage_size
  reserved_concurrent_executions  = var.reserved_concurrent_executions
  dead_letter_target_arn          = var.dead_letter_target_arn
  environment_variables           = local.environment.variables
  tracing_mode                    = var.tracing_mode
  recursive_loop                  = var.recursive_loop

  # Packaging / source
  package_type                    = var.package_type
  ignore_source_code_hash         = local.ignore_source_code_hash
  local_existing_package          = local.local_existing_package
  s3_existing_package             = var.s3_existing_package
  store_on_s3                     = var.store_on_s3
  s3_object_storage_class         = var.s3_object_storage_class
  s3_bucket                       = var.s3_bucket
  s3_prefix                       = var.s3_prefix
  s3_acl                          = var.s3_acl
  s3_server_side_encryption       = var.s3_server_side_encryption
  s3_kms_key_id                   = var.s3_kms_key_id
  s3_object_tags                  = var.s3_object_tags
  s3_object_tags_only             = var.s3_object_tags_only
  s3_object_override_default_tags = var.s3_object_override_default_tags
  artifacts_dir                   = var.artifacts_dir
  source_path                     = var.source_path
  hash_extra                      = var.hash_extra
  build_in_docker                 = var.build_in_docker
  docker_file                     = var.docker_file
  docker_build_root               = var.docker_build_root
  docker_image                    = var.docker_image
  docker_with_ssh_agent           = var.docker_with_ssh_agent
  docker_pip_cache                = var.docker_pip_cache
  docker_additional_options       = var.docker_additional_options
  docker_entrypoint               = var.docker_entrypoint
  recreate_missing_package        = var.recreate_missing_package
  trigger_on_package_timestamp    = var.trigger_on_package_timestamp
  quiet_archive_local_exec        = var.quiet_archive_local_exec

  # Container image options
  image_uri                      = var.image_uri
  image_config_entry_point       = var.image_config_entry_point
  image_config_command           = var.image_config_command
  image_config_working_directory = var.image_config_working_directory

  # Layer metadata
  layer_name               = var.layer_name
  layer_skip_destroy       = var.layer_skip_destroy
  license_info             = var.license_info
  compatible_runtimes      = var.compatible_runtimes
  compatible_architectures = var.compatible_architectures

  # Networking
  vpc_subnet_ids                     = var.vpc_subnet_ids
  vpc_security_group_ids             = var.vpc_security_group_ids
  ipv6_allowed_for_dual_stack        = var.ipv6_allowed_for_dual_stack
  replace_security_groups_on_destroy = var.replace_security_groups_on_destroy
  replacement_security_group_ids     = var.replacement_security_group_ids
  file_system_arn                    = var.file_system_arn
  file_system_local_mount_path       = var.file_system_local_mount_path
  timeouts                           = var.timeouts
  skip_destroy                       = var.skip_destroy
  region                             = var.region

  # Async event configuration
  create_async_event_config                   = var.create_async_event_config
  create_current_version_async_event_config   = var.create_current_version_async_event_config
  create_unqualified_alias_async_event_config = var.create_unqualified_alias_async_event_config
  maximum_event_age_in_seconds                = var.maximum_event_age_in_seconds
  maximum_retry_attempts                      = var.maximum_retry_attempts
  destination_on_failure                      = var.destination_on_failure
  destination_on_success                      = var.destination_on_success
  provisioned_concurrent_executions           = var.provisioned_concurrent_executions

  # Triggers and permissions
  allowed_triggers                          = local.allowed_triggers
  create_current_version_allowed_triggers   = var.create_current_version_allowed_triggers
  create_unqualified_alias_allowed_triggers = var.create_unqualified_alias_allowed_triggers
  event_source_mapping                      = local.event_source_mapping

  # CloudWatch logs
  cloudwatch_logs_retention_in_days  = try(local.cloudwatch_logs_retention[var.env], local.cloudwatch_logs_retention.default).cloudwatch_logs_retention_in_days
  use_existing_cloudwatch_log_group  = local.use_existing_cloudwatch_log_group
  attach_create_log_group_permission = local.attach_create_log_group_permission
  attach_cloudwatch_logs_policy      = var.attach_cloudwatch_logs_policy
  cloudwatch_logs_kms_key_id         = var.cloudwatch_logs_kms_key_id
  cloudwatch_logs_skip_destroy       = var.cloudwatch_logs_skip_destroy
  cloudwatch_logs_log_group_class    = var.cloudwatch_logs_log_group_class
  cloudwatch_logs_tags               = var.cloudwatch_logs_tags

  # IAM role/policy
  role_name                     = var.role_name != null ? var.role_name : "${var.service_name}-${var.function_name}-${random_string.data_random.result}-${var.env}"
  role_description              = var.role_description
  role_path                     = var.role_path
  role_force_detach_policies    = var.role_force_detach_policies
  role_permissions_boundary     = var.role_permissions_boundary
  role_tags                     = var.role_tags
  role_maximum_session_duration = var.role_maximum_session_duration
  policy_name                   = var.policy_name != null ? var.policy_name : "${var.service_name}-${var.function_name}-${random_string.data_random.result}-${var.env}"
  policy_statements             = local.policy_statements
  attach_policy_statements      = var.attach_policy_statements != null ? var.attach_policy_statements : length(keys(local.policy_statements)) > 0
  attach_tracing_policy         = var.attach_tracing_policy
  attach_dead_letter_policy     = var.attach_dead_letter_policy
  attach_network_policy         = var.attach_network_policy
  attach_async_event_policy     = var.attach_async_event_policy
  attach_policy_json            = var.attach_policy_json
  attach_policy_jsons           = var.attach_policy_jsons
  attach_policy                 = var.attach_policy
  attach_policies               = var.attach_policies
  number_of_policy_jsons        = var.number_of_policy_jsons
  number_of_policies            = var.number_of_policies
  trusted_entities              = var.trusted_entities
  assume_role_policy_statements = var.assume_role_policy_statements
  policy_json                   = var.policy_json
  policy_jsons                  = var.policy_jsons
  policy                        = var.policy
  policies                      = var.policies

  # Tags
  tags                = var.tags
  include_default_tag = var.include_default_tag
  function_tags       = var.function_tags

  # Lambda URL
  create_unqualified_alias_lambda_function_url = var.create_unqualified_alias_lambda_function_url
  authorization_type                           = var.authorization_type
  cors                                         = var.cors
  invoke_mode                                  = var.invoke_mode

  # Advanced logging
  logging_log_format            = var.logging_log_format
  logging_application_log_level = var.logging_application_log_level
  logging_system_log_level      = var.logging_system_log_level
  logging_log_group             = var.logging_log_group

  # Misc
  snap_start = var.snap_start
}

resource "random_string" "data_random" {
  length  = 5
  special = false
}
