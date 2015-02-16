require "test_helper"

class GiftcertificateTest < ActiveSupport::TestCase

  def giftcertificate
    @giftcertificate ||= Giftcertificate.new
  end

  def test_valid
    assert giftcertificate.valid?
  end

end
