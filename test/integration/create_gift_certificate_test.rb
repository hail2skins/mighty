require "test_helper"

class CreateGiftCertificateTest < ActionDispatch::IntegrationTest
  def setup
    login
  end
  
  def teardown
    click_link "Logout"
  end
  
  def business
    businesses(:business)
  end
  
  def customer1
    customers(:david)
  end
  
  def purchased_on
    customer1.gift_certificates.first.created_at.to_date.strftime("%m/%d/%Y")
  end
  
  def customer
    customers(:art)
  end
  
  def certificate
    gift_certificates(:first_certificate)
  end
  
  test 'create first gift certificate from customer show page' do
    click_link customer1.first_name
    
    assert page.has_link?("Buy Gift Certificate"),
                          "Link -- Buy Gift Certificate not available."
    
    click_link "Buy Gift Certificate"
    
    assert_equal new_customer_gift_certificate_path(customer1), current_path
    
    assert page.has_title?("Purchase a Gift Certificate"),
                           "Title -- Purchase a Gift Certificate not available."
                           
    assert page.has_content?("Purchase a Gift Certificate"),
                             "Content -- Purchase a Gift Certificate not available"
                             
    assert page.has_field?("Certificate Amount"),
                           "Field -- Certificate Amount not available."
                           
    assert page.has_field?("Certificate Comment"),
                           "Field -- Initial Comment not available."
                           
    assert page.has_button?("Create Gift certificate"),
                            "Button -- Create Gift certificate not available."
                            
    fill_in "Certificate Amount", with: "120"
    fill_in "Certificate Comment", with: "David's first certificate."
    
    click_button "Create Gift certificate"
    
    assert_equal customer_gift_certificate_path(customer1, customer1.gift_certificates.first), current_path,
                 "Expected to be at gift certificate show page, but, instead at #{current_path}."
                 
    assert page.has_content?("Gift Certificate created"),
                             "Content -- Gift Certificate created not available."
                            
    #Certificate Number 1 is set in the gift_certificate fixture
    assert page.has_content?("Certificate Number: 2"),
                             "Content -- Certificate Number: 2 not available."
                             
    assert page.has_content?("Certificate Amount: $120.00"),
                             "Content -- Certificate Amount: $120.00 not available."
                             
    assert page.has_content?("Redeemed?: No"),
                             "Content -- Redeemed?: No not available."
                             
    assert page.has_content?("Purchased By: #{customer1.name}"),
                             "Content -- Purchased By: #{customer1.name} not available."
                             
    assert page.has_content?("Purchased On: #{purchased_on}"),
                             "Content -- Purchased On: #{purchased_on} not available"
                             
    assert page.has_content?("Certificate Comment: David's first certificate."),
                             "Content -- Certificate Comment: David's first certificate not available."
                           
    assert page.has_link?("Return to customer page"),
                          "Link -- Return to customer page not available."
                          
    assert page.has_link?("Return to main business page"),
                          "Link -- Return to main business page not available."
                          
    click_link "Return to customer page"
    
    assert_equal business_customer_path(business, customer1), current_path,
                 "Expected to be at customer show page, but, instead at #{current_path}."    
                 
    refute page.has_link?("Buy Gift Certificate"),
                          "Link -- Buy Gift Certificate exists but should not."
                          
    assert page.has_link?("Buy More Gift Certificates"),
                          "Link -- Buy More Gift Certificates not available."
   
    assert page.has_content?("Gift Certificates Purchased: 1"),
                             "Content -- Gift Certificates Purchased: 1 not available."
   
    assert page.has_link?("Gift Certificates Purchased:"),
                          "Link -- Gift Certificates Purchased: not available."
                          
  end
  
  test "confirm Buy More Gift Certificates link works" do
    #Not going to create another as we presume new works, but we will confirm the link is right.
    click_link customer.first_name
    
    click_link "Buy More Gift Certificates"
    
    assert_equal new_customer_gift_certificate_path(customer), current_path,
                 "Expected to be at new customer gift certificate page, but at #{current_path}."
    
  end
  
  test "create gift certificate with validate check for price" do
    click_link customer.first_name
    
    click_link "Buy More Gift Certificates"
    
    click_button "Create Gift certificate"
    
    assert page.has_content?("1 error prohibited this Gift Certificate from being saved:"),
                             "Content -- 1 error prohibited saving not available."
                             
    assert page.has_content?("Prices amount can't be blank"),
                             "Content -- Prices amount can't be blank not available."
  end
  
  
end
