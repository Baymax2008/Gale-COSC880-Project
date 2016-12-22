require 'test_helper'

class TestMailerTest < ActionMailer::TestCase
  test "test_request" do
    mail = TestMailer.test_request
    assert_equal "Test request", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
