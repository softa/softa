require 'test_helper'

class SiteTest < ActionMailer::TestCase
  test "contact" do
    mail = Site.contact
    assert_equal "Contact", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
