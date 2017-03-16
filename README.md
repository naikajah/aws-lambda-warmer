# AWS-LAMBDA-WARMER
Lambda cold start is a common problem and there are multiple solutions available.
The aws-lambda-warmer lambda function can be used to keep N instances of a particular
lambda warm over a certain period.

where N ~ CONCURRENT_TARGET_COUNT specified through environment variable.

## Getting Started
The project contains simple NODEJS lambda code and the terraform code to setup this warmer lambda.

### Deployment
* Clone the project
* zip the file aws_lambda_warmer.js to aws_lambda_warmer.zip
* Copy the zipped file inside terraform directory
* run 'terraform plan' (Defaults to the terarform are already supplied in the variables.tf file. Create an environment.tfvar file to override the variable values.)
* run 'terraform apply'

terraform apply will create the lambda function and any dependent resources in the AWS account specified.


### Environment variables
Following parameters are required for AWS-LAMBDA-WARMER
* FUNCTION_NAME - The name of the lambda function which require to be warmed.
* CONCURRENT_TARGET_COUNT - The number of the instances of the lambda to be warmed.
* PAYLOAD - Any payload that needs to be supplied to the warmed lambda function.

