require "test_helper"

class BusinessUpdatesServicesTest < ActionDispatch::IntegrationTest
  def setup
    login
  end
  
  def teardown
    click_link "Logout"
  end
  
end
