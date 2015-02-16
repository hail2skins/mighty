require "test_helper"

class PriceTest < ActiveSupport::TestCase

  def price
    @price ||= Price.new
  end

  def test_valid
    assert price.valid?
  end

end
