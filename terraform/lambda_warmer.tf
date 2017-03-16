resource "aws_lambda_function" "LambdaWarmer" {
  description       = "LambdaWarmer"
  runtime           = "nodejs4.3"
  filename          = "${var.lambda_function_filename}"
  function_name     = "aws_lambda_warmer-${var.environment}"
  role              = "${aws_iam_role.LambdaWarmerRole.arn}"
  handler           = "aws_lambda_warmer.warmup"
  publish           = "${var.LambdaWarmer_publish}"
  memory_size       = "${var.LambdaWarmer_mem_size}"
  timeout           = "${var.LambdaWarmer_timeout}"
  
  environment {
    variables = {
      REGION                  = "${var.aws_region}"
      FUNCTION_NAME           = "${var.warming_function_name}"
      CONCURRENT_TARGET_COUNT = "${var.concurrent_target_count}"
      PAYLOAD                 = "${var.payload}"
    }
  }
}
