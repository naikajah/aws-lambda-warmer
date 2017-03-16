variable "aws_region" {
  type        = "string"
  description = "AWS region"
  default     = "eu-west-1"
}

variable "environment" {
  type        = "string"
  description = "Environment name"
  default     = "test"
}

variable "bucket_prefix" {
  type        = "string"
  description = "S3 bucket prefix"
  default     = "lambda_warmer"
}

variable "LambdaWarmer_publish" {
  type        = "string"
  description = "WebApp Lambda publish switch"
  default     = false
}

variable "LambdaWarmer_mem_size" {
  type        = "string"
  description = "Amount of memory in MB Lambda Function can use at runtime"
  default     = "128"
}

variable "LambdaWarmer_timeout" {
  type        = "string"
  description = "The amount of time Lambda Function has to run in seconds"
  default     = "10"
}

variable "warming_function_name" {
  type        = "string"
  description = "Name of the lambda function that needs to be warmed"
}

variable "concurrent_target_count" {
  type        = "string"
  description = "The amount of time Lambda Function has to run in seconds"
  default     = "10"
}

variable "payload" {
  type        = "string"
  description = "The amount of time Lambda Function has to run in seconds"
  default     = "{ \"ping\": true }"
}

variable "lambda_function_filename" {
  type        = "string"
  description = "Zip file for the warmer lambda function"
  default     = "aws_lambda_warmer.zip"
}
