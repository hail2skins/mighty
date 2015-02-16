require "test_helper"

class OwnersSignupTest < ActionDispatch::IntegrationTest

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
  
  test 'edit gift certificate from customer profile' do

    assert page.has_title?("#{business.name} Profile Page"), 
                           "#{business.name} not present."
    
    click_link "#{customer.first_name}"
    
    assert_equal business_customer_path(business, customer), current_path
    
    click_link "Gift Certificates Purchased"
    
    assert_equal customer_gift_certificates_path(customer), current_path
    
    assert page.has_content?(gift_certificates(:first_certificate).prices.last.amount),
                            "Correct amount, #{gift_certificates(:first_certificate).prices.last.amount}, not listed."
                            
    assert_equal gift_certificates(:first_certificate).certificate_number, 2
    
  end
    
    
  

end
