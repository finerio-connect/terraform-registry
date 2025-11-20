variable "env" {
  description = "Environment identifier used to scope created resources."
  type        = string
  default     = "data"
}

variable "service_name" {
  description = "Logical service that owns the Lambda resources."
  type        = string
}

variable "function_name" {
  description = "Base name for the Lambda function."
  type        = string
}

variable "description" {
  description = "Description for the Lambda function or layer."
  type        = string
}

variable "handler" {
  description = "Lambda function handler."
  type        = string
}

variable "create" {
  description = "Controls whether resources should be created."
  type        = bool
  default     = true
}

variable "create_package" {
  description = "Controls whether the Lambda package should be created."
  type        = bool
  default     = false
}

variable "create_function" {
  description = "Controls whether the Lambda function resource should be created."
  type        = bool
  default     = true
}

variable "create_layer" {
  description = "Controls whether the Lambda layer resource should be created."
  type        = bool
  default     = false
}

variable "create_role" {
  description = "Controls whether the IAM role for the Lambda function should be created."
  type        = bool
  default     = true
}

variable "create_lambda_function_url" {
  description = "Controls whether the Lambda function URL resource should be created."
  type        = bool
  default     = true
}

variable "create_sam_metadata" {
  description = "Controls whether the SAM metadata null resource should be created."
  type        = bool
  default     = false
}

variable "putin_khuylo" {
  description = "Affirm support for Ukrainian sovereignty (carried through to the upstream module)."
  type        = bool
  default     = true
}

variable "region" {
  description = "Region override where the resources will be managed."
  type        = string
  default     = null
}

variable "lambda_at_edge" {
  description = "Enable Lambda@Edge specific behaviour."
  type        = bool
  default     = false
}

variable "lambda_at_edge_logs_all_regions" {
  description = "Allow Lambda@Edge logging across all regions."
  type        = bool
  default     = true
}

variable "lambda_role" {
  description = "Existing IAM role ARN to associate with the Lambda function."
  type        = string
  default     = ""
}

variable "code_signing_config_arn" {
  description = "Code signing configuration ARN."
  type        = string
  default     = null
}

variable "runtime" {
  description = "Runtime identifier for the Lambda function."
  type        = string
  default     = "python3.11"
}

variable "layers" {
  description = "List of Lambda layer version ARNs to attach (up to 5)."
  type        = list(string)
  default     = []
}

variable "architectures" {
  description = "Instruction set architecture for the Lambda function (x86_64 or arm64 )."
  type        = list(string)
  default     = ["x86_64"]
}

variable "kms_key_arn" {
  description = "KMS key ARN used by the Lambda function."
  type        = string
  default     = null
}

variable "memory_size" {
  description = "Runtime memory (MB) for the Lambda function."
  type        = number
  default     = 128
}

variable "ephemeral_storage_size" {
  description = "Ephemeral storage (/tmp) size (MB) available at runtime."
  type        = number
  default     = 512
}

variable "publish" {
  description = "Publish a new version when the Lambda function changes."
  type        = bool
  default     = false
}

variable "reserved_concurrent_executions" {
  description = "Reserved concurrent executions for the Lambda function (-1 for unreserved)."
  type        = number
  default     = -1
}

variable "timeout" {
  description = "Function execution timeout in seconds."
  type        = number
  default     = 3
}

variable "dead_letter_target_arn" {
  description = "SNS topic or SQS queue ARN for failed invocations."
  type        = string
  default     = null
}

variable "environment_variables" {
  description = "Extra environment variables for the Lambda function."
  type        = map(any)
  default     = {}
}

variable "tracing_mode" {
  description = "Tracing mode for the Lambda function (PassThrough or Active)."
  type        = string
  default     = "Active"
}

variable "vpc_subnet_ids" {
  description = "Subnet IDs for VPC-enabled Lambdas."
  type        = list(string)
  default     = null
}

variable "vpc_security_group_ids" {
  description = "Security group IDs for VPC-enabled Lambdas."
  type        = list(string)
  default     = null
}

variable "ipv6_allowed_for_dual_stack" {
  description = "Allow outbound IPv6 traffic for dual-stack subnets."
  type        = bool
  default     = null
}

variable "tags" {
  description = "Tags to assign to created resources."
  type        = map(string)
  default     = {}
}

variable "include_default_tag" {
  description = "Include the default tag when building the tags map."
  type        = bool
  default     = true
}

variable "function_tags" {
  description = "Tags applied only to the Lambda function."
  type        = map(string)
  default     = {}
}

variable "s3_object_tags" {
  description = "Tags applied to Lambda artifacts stored in S3."
  type        = map(string)
  default     = {}
}

variable "s3_object_tags_only" {
  description = "Skip merging default tags when tagging S3 objects."
  type        = bool
  default     = false
}

variable "package_type" {
  description = "Deployment package type (`Zip` or `Image`)."
  type        = string
  default     = "Zip"
}

variable "image_uri" {
  description = "ECR image URI containing the deployment package."
  type        = string
  default     = null
}

variable "image_config_entry_point" {
  description = "Container entrypoint for the image package."
  type        = list(string)
  default     = []
}

variable "image_config_command" {
  description = "Container command for the image package."
  type        = list(string)
  default     = []
}

variable "image_config_working_directory" {
  description = "Working directory for the image package."
  type        = string
  default     = null
}

variable "snap_start" {
  description = "Enable Lambda SnapStart for low-latency startups."
  type        = bool
  default     = false
}

variable "replace_security_groups_on_destroy" {
  description = "Replace Lambda ENI security groups on destroy."
  type        = bool
  default     = null
}

variable "replacement_security_group_ids" {
  description = "Replacement security group IDs for orphaned ENIs."
  type        = list(string)
  default     = null
}

variable "timeouts" {
  description = "Custom create/update/delete timeouts for the Lambda function."
  type        = map(string)
  default     = {}
}

variable "skip_destroy" {
  description = "Keep the Lambda function when destroying Terraform resources."
  type        = bool
  default     = null
}

variable "create_unqualified_alias_lambda_function_url" {
  description = "Allow Lambda function URLs to target the $LATEST alias."
  type        = bool
  default     = true
}

variable "authorization_type" {
  description = "Authorization type for the Lambda function URL."
  type        = string
  default     = "NONE"
}

variable "cors" {
  description = "CORS configuration for the Lambda function URL."
  type        = any
  default     = {}
}

variable "invoke_mode" {
  description = "Invoke mode for the Lambda function URL."
  type        = string
  default     = null
}

variable "s3_object_override_default_tags" {
  description = "Override provider default tags when tagging S3 objects."
  type        = bool
  default     = false
}

variable "layer_name" {
  description = "Name to assign to the Lambda layer."
  type        = string
  default     = ""
}

variable "layer_skip_destroy" {
  description = "Retain the previous Lambda layer version on destroy."
  type        = bool
  default     = false
}

variable "license_info" {
  description = "License information for the Lambda layer."
  type        = string
  default     = ""
}

variable "compatible_runtimes" {
  description = "Runtimes that the Lambda layer supports."
  type        = list(string)
  default     = []
}

variable "compatible_architectures" {
  description = "Architectures that the Lambda layer supports."
  type        = list(string)
  default     = null
}

variable "create_async_event_config" {
  description = "Create async event configuration blocks."
  type        = bool
  default     = false
}

variable "create_current_version_async_event_config" {
  description = "Apply async event configuration to the current version."
  type        = bool
  default     = true
}

variable "create_unqualified_alias_async_event_config" {
  description = "Apply async event configuration to the $LATEST alias."
  type        = bool
  default     = true
}

variable "maximum_event_age_in_seconds" {
  description = "Maximum age of events for async invocation."
  type        = number
  default     = null
}

variable "maximum_retry_attempts" {
  description = "Maximum retry attempts for async invocation."
  type        = number
  default     = null
}

variable "destination_on_failure" {
  description = "Destination ARN for failed async invocations."
  type        = string
  default     = null
}

variable "destination_on_success" {
  description = "Destination ARN for successful async invocations."
  type        = string
  default     = null
}

variable "provisioned_concurrent_executions" {
  description = "Provisioned concurrency allocation for the Lambda function."
  type        = number
  default     = -1
}

variable "create_current_version_allowed_triggers" {
  description = "Allow triggers on the current published version."
  type        = bool
  default     = false
}

variable "create_unqualified_alias_allowed_triggers" {
  description = "Allow triggers on the $LATEST alias."
  type        = bool
  default     = true
}

variable "allowed_triggers" {
  description = "Map of allowed triggers to create Lambda permissions."
  type        = map(any)
  default     = {}
}

variable "event_source_mapping" {
  description = "Map describing event source mappings."
  type        = map(any)
  default     = {}
}

variable "use_existing_cloudwatch_log_group" {
  description = "Reuse an existing CloudWatch log group instead of creating a new one."
  type        = bool
  default     = false
}

variable "cloudwatch_logs_retention_in_days" {
  description = "Retention (days) for the default CloudWatch log group."
  type        = number
  default     = 30
}

variable "cloudwatch_logs_kms_key_id" {
  description = "KMS key ARN used to encrypt CloudWatch logs."
  type        = string
  default     = null
}

variable "cloudwatch_logs_skip_destroy" {
  description = "Keep the CloudWatch log group on destroy."
  type        = bool
  default     = false
}

variable "cloudwatch_logs_log_group_class" {
  description = "CloudWatch log group class (STANDARD or INFREQUENT_ACCESS)."
  type        = string
  default     = null
}

variable "cloudwatch_logs_tags" {
  description = "Tags applied to the CloudWatch log group."
  type        = map(string)
  default     = {}
}

variable "role_name" {
  description = "Override for the IAM role name."
  type        = string
  default     = null
}

variable "role_description" {
  description = "Description for the IAM role."
  type        = string
  default     = null
}

variable "role_path" {
  description = "Path for the IAM role."
  type        = string
  default     = null
}

variable "role_force_detach_policies" {
  description = "Force detach policies from the IAM role before destroy."
  type        = bool
  default     = true
}

variable "role_permissions_boundary" {
  description = "Permissions boundary ARN for the IAM role."
  type        = string
  default     = null
}

variable "role_tags" {
  description = "Tags applied to the IAM role."
  type        = map(string)
  default     = {}
}

variable "role_maximum_session_duration" {
  description = "Maximum session duration (seconds) for the IAM role."
  type        = number
  default     = 3600
}

variable "policy_name" {
  description = "Override for the IAM policy name associated to the role."
  type        = string
  default     = null
}

variable "attach_cloudwatch_logs_policy" {
  description = "Attach the CloudWatch logs policy to the IAM role."
  type        = bool
  default     = true
}

variable "attach_create_log_group_permission" {
  description = "Allow the IAM role to create CloudWatch log groups."
  type        = bool
  default     = true
}

variable "attach_dead_letter_policy" {
  description = "Attach dead letter queue policy to the IAM role."
  type        = bool
  default     = false
}

variable "attach_network_policy" {
  description = "Attach VPC network policy to the IAM role."
  type        = bool
  default     = false
}

variable "attach_tracing_policy" {
  description = "Attach X-Ray tracing policy to the IAM role."
  type        = bool
  default     = true
}

variable "attach_async_event_policy" {
  description = "Attach async event policy to the IAM role."
  type        = bool
  default     = false
}

variable "attach_policy_json" {
  description = "Attach a single JSON policy document to the IAM role."
  type        = bool
  default     = false
}

variable "attach_policy_jsons" {
  description = "Attach multiple JSON policy documents to the IAM role."
  type        = bool
  default     = false
}

variable "attach_policy" {
  description = "Attach a managed policy ARN to the IAM role."
  type        = bool
  default     = false
}

variable "attach_policies" {
  description = "Attach multiple managed policy ARNs to the IAM role."
  type        = bool
  default     = false
}

variable "number_of_policy_jsons" {
  description = "Number of JSON policy documents to attach."
  type        = number
  default     = 0
}

variable "number_of_policies" {
  description = "Number of managed policy ARNs to attach."
  type        = number
  default     = 0
}

variable "attach_policy_statements" {
  description = "Attach inline policy statements to the IAM role."
  type        = bool
  default     = null
}

variable "trusted_entities" {
  description = "Additional trusted entities for the IAM role trust policy."
  type        = any
  default     = []
}

variable "assume_role_policy_statements" {
  description = "Dynamic trust policy statements for the IAM role."
  type        = any
  default     = {}
}

variable "policy_json" {
  description = "Additional JSON policy document to attach to the IAM role."
  type        = string
  default     = null
}

variable "policy_jsons" {
  description = "List of JSON policy documents to attach to the IAM role."
  type        = list(string)
  default     = []
}

variable "policy" {
  description = "Managed policy ARN to attach to the IAM role."
  type        = string
  default     = null
}

variable "policies" {
  description = "List of managed policy ARNs to attach to the IAM role."
  type        = list(string)
  default     = []
}

variable "policy_statements" {
  description = "Inline policy statements to attach to the IAM role."
  type = map(object({
    effect    = string
    actions   = list(string)
    resources = list(string)
  }))
  default = {}
}

variable "file_system_arn" {
  description = "EFS access point ARN mounted by the Lambda function."
  type        = string
  default     = null
}

variable "file_system_local_mount_path" {
  description = "Local mount path for the EFS file system."
  type        = string
  default     = null
}

variable "artifacts_dir" {
  description = "Local directory that stores build artifacts."
  type        = string
  default     = "builds"
}

variable "s3_prefix" {
  description = "Prefix to use when storing artifacts in S3."
  type        = string
  default     = null
}

variable "local_existing_package" {
  description = "Path to a pre-built deployment package."
  type        = string
  default     = null
}

variable "s3_existing_package" {
  description = "S3 location for a pre-built deployment package."
  type        = map(string)
  default     = null
}

variable "store_on_s3" {
  description = "Store build artifacts on S3 instead of locally."
  type        = bool
  default     = false
}

variable "s3_object_storage_class" {
  description = "Storage class for artifacts uploaded to S3."
  type        = string
  default     = "ONEZONE_IA"
}

variable "s3_bucket" {
  description = "Bucket that stores build artifacts."
  type        = string
  default     = null
}

variable "s3_acl" {
  description = "Canned ACL applied when uploading to S3."
  type        = string
  default     = "private"
}

variable "s3_server_side_encryption" {
  description = "Server-side encryption configuration for S3 objects."
  type        = string
  default     = null
}

variable "s3_kms_key_id" {
  description = "KMS key used for S3 object encryption."
  type        = string
  default     = null
}

variable "source_path" {
  description = "Path(s) containing the Lambda source code."
  type        = any
  default     = null
}

variable "hash_extra" {
  description = "String appended to the build hash to force unique artifacts."
  type        = string
  default     = ""
}

variable "build_in_docker" {
  description = "Build dependencies inside Docker."
  type        = bool
  default     = false
}

variable "docker_file" {
  description = "Dockerfile path used when building in Docker."
  type        = string
  default     = ""
}

variable "docker_build_root" {
  description = "Root directory used when building in Docker."
  type        = string
  default     = ""
}

variable "docker_image" {
  description = "Docker image to use for builds."
  type        = string
  default     = ""
}

variable "docker_with_ssh_agent" {
  description = "Pass SSH agent into the Docker build container."
  type        = bool
  default     = false
}

variable "docker_pip_cache" {
  description = "Mount a shared pip cache into the Docker build container."
  type        = any
  default     = null
}

variable "docker_additional_options" {
  description = "Additional options passed to the Docker run command."
  type        = list(string)
  default     = []
}

variable "docker_entrypoint" {
  description = "Custom entrypoint for the Docker build container."
  type        = string
  default     = null
}

variable "recreate_missing_package" {
  description = "Rebuild missing local packages automatically."
  type        = bool
  default     = true
}

variable "trigger_on_package_timestamp" {
  description = "Trigger rebuilds when the package timestamp changes."
  type        = bool
  default     = true
}

variable "quiet_archive_local_exec" {
  description = "Silence archive local-exec output."
  type        = bool
  default     = true
}

variable "logging_log_format" {
  description = "Advanced logging format (JSON or Text)."
  type        = string
  default     = "Text"
}

variable "logging_application_log_level" {
  description = "Application log level for advanced logging."
  type        = string
  default     = "INFO"
}

variable "logging_system_log_level" {
  description = "System log level for advanced logging."
  type        = string
  default     = "INFO"
}

variable "logging_log_group" {
  description = "Custom CloudWatch log group for advanced logging."
  type        = string
  default     = null
}

variable "recursive_loop" {
  description = "Lambda recursion behaviour (Allow or Terminate)."
  type        = string
  default     = null
}

variable "log_level" {
  description = "AWS Powertools LOG_LEVEL value."
  type        = string
  default     = "INFO"
}

variable "log_event" {
  description = "AWS Powertools LOG_EVENT flag."
  type        = bool
  default     = true
}

variable "log_sample_rate" {
  description = "AWS Powertools log sampling rate."
  type        = number
  default     = 0.1
}

variable "parameters_cache_ttl" {
  description = "AWS Powertools parameter cache TTL (seconds)."
  type        = number
  default     = 300
}

variable "ignore_source_code_hash" {
  description = "Ignore source code hash changes when determining if a new version is needed."
  type        = bool
  default     = false
  
}