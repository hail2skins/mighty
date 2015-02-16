require "test_helper"

class OwnersSignupTest < ActionDispatch::IntegrationTest
  def test_sanity
    flunk "Need real tests"
  end
  
  def setup
    login
  end
  
  def teardown
    click_link "Logout"
  end
  
  test 'visit home page and login' do

    assert page.has_content?("Signed in successfully."), 'Signed in successfully not present.'



    assert page.has_title?("#{businesses(:business).name} Profile Page"), 
                           "#{businesses(:business).name} not present."
    
    
  end
    
    
  

end
