require "test_helper"

class BusinessUpdatesServicesTest < ActionDispatch::IntegrationTest
  def setup
    login
  end
  
  def teardown
    click_link "Logout"
  end
  
  test "updating services from service index" do
    click_link "Number of services:"
    click_link "Microderm"
    check_links "Edit this service"
    
  end
  
end
