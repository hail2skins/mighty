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
    click_link "Edit this service"
    
    assert_equal edit_business_service_path(business, service_one), current_path
    assert_field "Service name"
    assert_field "Description"
    assert_field "Price"
    
  end
  
end
