class ApplicationMailer < ActionMailer::Base
  default from: "'Matt' <from@example.com>"
  layout 'mailer'
end
