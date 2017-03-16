/*
*  A simple aws-lambda-warmer lambda function invokes another
*  lambda function and keeps ~N instances warm over a period of time.
*/

var AWS = require('aws-sdk');
AWS.config.region = process.env.REGION;
var lambda = new AWS.Lambda();

exports.warmup = function(event, context) {
  var params = {
    FunctionName: process.env.FUNCTION_NAME, // the lambda function to invoke
    InvocationType: 'Event',
    LogType: 'Tail',
    Payload: process.env.PAYLOAD
  };

 for(var i = 0; i < parseInt(process.env.CONCURRENT_TARGET_COUNT); i++) {
  lambda.invoke(params, function(err, data) {
    if (err) {
      context.done('error', err);
    }
    if(data.Payload){
      context.succeed(data.Payload)
    }
   });
 }
}
