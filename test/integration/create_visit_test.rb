require "test_helper"

class CreateVisitTest < ActionDispatch::IntegrationTest
  def setup
    login
  end
  
  def teardown
    click_link "Logout"
  end
  
  def business
    businesses(:business)
  end
  
  def customer
    customers(:art)
  end
  
  def customer1
    customers(:david)
  end
  
  def service_one
    services(:microderm)
  end
  
  def service_two
    services(:facial)
  end
  
  test "create visit from main business show page" do
    
    click_link "0"
    
    assert_equal new_customer_visit_path(customer1), current_path,
                "Expected to be at David's new visit form, but at #{current_path}."
    
  end



end
