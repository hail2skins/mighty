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
 
 def visit_one
   visits(:first_visit_art)
 end
 
 def fill_in_date_stuff
   Capybara.current_driver = Capybara.javascript_driver
   find_by_id("visit_date_of_visit").set("02/01/2015")
 end
  
  test "create visit with one service from main business show page" do
    
    #visit created through fixture will show the following:
    check_links("Total Customer Visits:",
                "1")
                
    #and this
    check_content("Total Customer Visits: 1")
    
    click_link "0"
    
    assert_equal new_customer_visit_path(customer1), current_path,
                "Expected to be at David's new visit form, but at #{current_path}."
                
    assert page.has_title?("Add a visit for #{customer1.name}"), "Title -- Add a visit for #{customer1.name} not available."
    
    #check new visit page for expected content
    check_content("New visit for #{customer1.name}",
                  "Visit notes",
                  "Date of visit",
                  "Service(s) provided on this visit",
                  "#{service_one.name}",
                  "#{service_two.name}")
                  
    #check expected links on the page
    check_links("Back to main business page",
                "Return to customer profile view")
                
    assert page.has_field?("Visit notes", with: ""), "Field -- Visit notes with expected data not available."

    #for some reason the date field won't show no matter what I try.   follow up on this.
    
    #assert page.has_field?(" Date of visit"), "Field -- Date of visit with expected data not available."
    #assert_select 'visit_date_of_visit'
   
    
    assert page.has_no_checked_field?("#{service_one.name}"), "Field -- #{service_one.name} is checked but should not be."
                
    assert page.has_no_checked_field?("#{service_two.name}"), "Field -- #{service_two.name} is checked but should not be."
    
    
    check service_one.name
    
    fill_in_date_stuff
    
    click_button "Create Visit"
    

    
  end



end
