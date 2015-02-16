require "test_helper"

class CustomerTest < ActiveSupport::TestCase

  def customer
    @customer ||= Customer.new
  end

  def test_valid
    assert customer.valid?
  end

end
