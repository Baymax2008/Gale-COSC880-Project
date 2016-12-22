class TestMailer < ApplicationMailer
  default from: email, to: email

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.test_mailer.test_request.subject
  #
  def test_request(test)
    @test = test
    mail subject: "JOIN Test Request"
  end

  def test_approved(test)
    @test = test
    mail subject: "JOIN Lab: Your test has been approved"
  end

  def test_ended(test)
    @test = test
    mail subject: "JOIN Lab: Your test is Over"
  end

  def test_started(test)
    @test = test
    mail subject: "JOIN Lab: Your test has began"
  end

end
