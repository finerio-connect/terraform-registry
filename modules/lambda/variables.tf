variable "env" {
  description = "Environment identifier used to scope created resources."
  type        = string
  default     = "data"
}

# ---------- Core ----------
variable "service_name" {
  description = "The logical service that owns the Lambda resources."
  type        = string
}

variable "function_name" {
  description = "Base name for the Lambda function."
  type        = string
}

variable "description" {
  description = "Description for the Lambda function."
  type        = string
}

variable "handler" {
  description = "Lambda function handler."
  type        = string
}

variable "local_existing_package" {
  description = "Path to a pre-built deployment package."
  type        = string
  default     = ""
}

variable "create_lambda_function_url" {
  description = "Whether to create a Lambda Function URL."
  type        = bool
  default     = false
}

# ---------- Runtime ----------
variable "runtime" {
  description = "Runtime identifier to use for the Lambda function."
  type        = string
  default     = "python3.11"
}

variable "timeout" {
  description = "Function execution timeout in seconds."
  type        = number
  default     = 3
}

variable "memory_size" {
  description = "Amount of memory, in MB, your Lambda function can use at runtime."
  type        = number
  default     = 128
}

variable "architectures" {
  description = "Instruction set architecture for the Lambda function."
  type        = list(string)
  default     = ["x86_64"]
}

variable "environment_variables" {
  description = "Extra environment variables for the Lambda function."
  type        = map(any)
  default     = {}
}

# ---------- Code ----------
variable "create_layer" {
  description = "Whether to build and publish a Lambda layer from the provided source."
  type        = bool
  default     = false
}

variable "create_package" {
  description = "Whether to build the Lambda deployment package."
  type        = bool
  default     = false
}

variable "ignore_source_code_hash" {
  description = "Whether to skip calculating the source code hash when deploying."
  type        = bool
  default     = false
}

variable "layers" {
  description = "List of additional Lambda layer ARNs to attach."
  type        = list(string)
  default     = []
}

# ---------- Logs ----------
variable "cloudwatch_logs_retention_in_days" {
  description = "Default number of days to retain CloudWatch Logs."
  type        = number
  default     = 30
}

variable "log_level" {
  description = "Powertools LOG_LEVEL value."
  type        = string
  default     = "INFO"
}

variable "log_event" {
  description = "Powertools LOG_EVENT flag."
  type        = bool
  default     = true
}

variable "log_sample_rate" {
  description = "Powertools log sampling rate."
  type        = number
  default     = 0.1
}

variable "parameters_cache_ttl" {
  description = "Powertools parameter store cache TTL (seconds)."
  type        = number
  default     = 300
}

# ---------- Permissions ----------
variable "policy_statements" {
  description = "Additional policy statements to attach to the Lambda role."
  type = map(object({
    effect    = string
    actions   = list(string)
    resources = list(string)
  }))
  default = {}
}

# --------- Events -------------
variable "event_source_mapping" {
  description = "Configuration for event source mappings."
  type        = map(any)
  default     = {}
}

# --------- Triggers -------------
variable "allowed_triggers" {
  description = "Configuration for event source triggers."
  type        = map(any)
  default     = {}
}
