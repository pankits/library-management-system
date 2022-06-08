Rails.configuration.stripe = {
  :publishable_key => 'pk_test_51L8IJfSARSQ5Ol2oOULLHmjtnn5unLZzhjAIryoXss0ra4EFAPJtYvs7zGVt4ByMIwAMehlm9ZGpeFchMWazPlW8005U1QVboZ',
  :secret_key      => 'sk_test_51L8IJfSARSQ5Ol2oejObMV33PfkwEmVyThHoakOXSLJGj9qDFyMqRNXIOpVp4b0brYZMtpzMUSOh043z05UF1pxG00igoAahtp'
}
 Stripe.api_key = Rails.configuration.stripe[:secret_key]

