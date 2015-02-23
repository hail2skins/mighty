require "test_helper"

class CreateCompVisitTest < ActionDispatch::IntegrationTest
  def setup
    login
    #confirm has spent $200 as the fixtures require
    check_content "$200.00"
    click_link "1"
  end
  
  def teardown
    find("header").click_link("Logout")
  end
  
  test "create a comp visit where you charge someone less" do
    check_content "Did you discount this visit?",
                  "If so, check the box below and type in the total amount you charged for this visit.",
                  "As an example, if you normally charge $100.00 for a service, but only charged this customer $75.00, check the box and type in $75.00.",
                  "When you click the Create Visit button, we'll do the math for you.",
                  "Check this ONLY if you wish to give a discount",
                  "Total charged for this visit?"
                  
    assert page.has_no_checked_field?("Check this ONLY if you wish to give a discount"), "Field -- Check this ONLY if you wish to give a discount is checked."
    
    find_field "Total charged for this visit?"
 
  
 
  
  end


end
