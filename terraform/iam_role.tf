data "template_file" "lambda_assumerole_policy" {
  template = "${file("${path.module}/policies/lambda_assumerole_policy.json.tpl")}"
}

resource "aws_iam_role" "LambdaWarmerRole" {
  name               = "LambdaWarmerRole-${var.environment}"
  assume_role_policy = "${data.template_file.lambda_assumerole_policy.rendered}"
}

data "template_file" "lambda_warmer_permissions_policy" {
  template = "${file("${path.module}/policies/lambda_warmer_permissions_policy.json.tpl")}"

  vars {
    aws_region              = "${var.aws_region}"
    environment             = "${var.environment}"
    account_id              = "${data.aws_caller_identity.current.account_id}"
    lambda_warming_function = "${var.warming_function_name}"
  }
}

resource "aws_iam_role_policy" "LambdaWarmerRolePolicy" {
  name   = "LambdaWarmerRolePolicy-${var.environment}"
  role   = "${aws_iam_role.LambdaWarmerRole.id}"
  policy = "${data.template_file.lambda_warmer_permissions_policy.rendered}"
}
