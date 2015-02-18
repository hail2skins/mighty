require "test_helper"

class RedeemGiftCertificateTest < ActionDispatch::IntegrationTest
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
  
  def certificate
    gift_certificates(:first_certificate)
  end

  test 'redeem gift certificate from main business page' do
  
  click_link "Gift Certificates"
  
  assert page.has_link?("Edit or Redeem"),
                       "Link to Edit or Redeem not present."
  
  
  
  end
  

end
