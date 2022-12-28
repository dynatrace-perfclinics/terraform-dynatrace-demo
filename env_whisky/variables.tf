variable "dt_token" {
  type        = string
  description = "Dynatrace token"
}

variable "dt_env_url" {
  type        = string
  description = "description"
}

variable "aws_acc_key" {
  type        = string
  description = "AWS Account Key"
}

variable "aws_secret" {
  type        = string
  description = "AWS Secret"
}

variable "dt_cluster_id" {
  type        = string
  description = "ID of Dynatrace cluster for lambda integration"
}

variable "dt_connection_auth_token" {
  type        = string
  description = "Token for authenticating lambda to Dynatrace"
}

variable "dt_connection_base_url" {
  type        = string
  description = "Base URL of Dyantrace environment"
}

variable "dt_tenant" {
  type        = string
  description = "Name of Dyantrace tenant"
}

variable "dt_lambda_layer_arn" {
  type        = string
  default     = "arn:aws:lambda:eu-central-1:725887861453:layer:Dynatrace_OneAgent_1_255_2_20221104-065150_python:1"
  description = "ARN of Lambda Layer for Dynatrace"
}

variable "env_codename" {
  type        = string
  description = "Code name of the environment"
}
