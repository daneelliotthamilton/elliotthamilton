ActionMailer::Base.smtp_settings = {
  domain:            'elliotthamilton.com',
  address:           "email-smtp.us-east-1.amazonaws.com",
  port:              587,
  authentication:    :plain,
  user_name:         Rails.application.credentials.ses[:user],
  password:          Rails.application.credentials.ses[:key]

}

ActionMailer::Base.raise_delivery_errors = true
