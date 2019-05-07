class ApplicationMailer < ActionMailer::Base
  default from: 'hi@sentry-city.herokuapp.com'
  layout 'mailer'
end
