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
    check_content "Microderm",
                  "Making a pretty face",
                  "$125.00"
    check_links "Edit this service"
    click_link "Edit this service"
    
    assert_equal edit_business_service_path(business, service_one), current_path
    assert_field "Service name"
    assert_field "Description"
    assert_field "Price"
    
    fill_in "Service name", with: "Abrasion"
    fill_in "Description", with: "The prettiest face there is."
    fill_in "Price", with: "130"
    click_button "Update Service"
    
    assert_equal owner_business_path(owner, business), current_path
    click_link "Number of services:"
    click_link "Abrasion"
    check_content "Abrasion",
                  "The prettiest face there is.",
                  "$130.00"
    save_and_open_page
    
    refute page.has_content?("Microderm"), "Microderm is still available."
    
  end
  
end
