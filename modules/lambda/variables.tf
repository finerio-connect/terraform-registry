variable "env" {
  description = "The environment project"
  type    = string
  default = "data"
}

# ---------- Core ----------
variable "lambda_name" {
  description = "The name lambda function"
  type = string
}

variable "lambda_description" {
  description = "The description lambda function"
  type = string
}

variable "lambda_handler" {
  description = "The handler location from lambda function"
  type = string
}

variable "lambda_source_code_package_path" {
  description = "The package code from lambda function"
  type = string
  default = ""
}

variable "lambda_service_name" {
  description = "The service name associated to lambda function"
  type = string
}

variable "lambda_create_lambda_function_url" {
  description = "The flag to create lambda function url to lambda function"
  type    = bool
  default = false
}

# ---------- Runtime ----------
variable "lambda_runtime_engine" {
  description = "The runtime from language used to lambda function"
  type    = string
  default = "python3.11"
}

variable "lambda_runtime_timeout" {
  description = "The runtime timeout from lambda function"
  type    = number
  default = 3
}

variable "lambda_runtime_memory" {
  description = "The runtime memory from lambda function"
  type    = number
  default = 128
}

variable "lambda_runtime_architecture" {
  description = "The runtime architecture from lambda function"
  type    = string
  default = "x86_64"
}

variable "lambda_environment_variables" {
  description = "The environment variables from lambda function"
  type    = map(any)
  default = {}
}

# ---------- Code ----------
variable "lambda_create_layer" {
  description = "The flag by create layer from lambda function"
  type    = bool
  default = false
}

variable "lambda_create_package" {
  description = "The flag to create code package to lambda function"
  type    = bool
  default = false
}

variable "lambda_ignore_source_code_hash" {
  description = "The flag to create code package to lambda function"
  type    = bool
  default = false
}

variable "lambda_layers" {
  description = "The list layer used to lambda function"
  type = list(string)
}

# ---------- Logs ----------
variable "lambda_logs_retention_in_days" {
  description = "The logs retention days saved in cloudwatch to lambda function"
  type    = number
  default = 30
}

variable "lambda_log_level" {
  description = "The log level configured to lambda function"
  type    = string
  default = "INFO"
}

variable "lambda_log_event" {
  description = "The logs incoming event configured to lambda function"
  type    = bool
  default = true
}

variable "lambda_log_rate" {
  description = "The debug log sampling configured to lambda function"
  type    = number
  default = 0.1
}

variable "lambda_cache_ssm" {
  description = "The adjust how long values are kept in cache (seconds) configured to lambda function"
  type    = number
  default = 300
}

# ---------- Permissions ----------
variable "lambda_policy_statements" {
  description = "The policy statements to lambda function"
  type = map(object({
    effect    = string
    actions   = list(string)
    resources = list(string)
  }))
  default = {}
}

# --------- Events -------------
variable "lambda_event_source_mapping" {
  description = "The event source mapping used to lambda function"
  type    = map(any)
  default = {}
}

# --------- Triggers -------------
variable "allowed_triggers" {
  description = "The allowed triggers mapping used to lambda function"
  type    = map(any)
  default = {}
}