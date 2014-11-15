 def create_visitor
  @visitor ||= {  first_name: "Testy", 
                  last_name: "McTesterton", 
                  email: "example@example.com",
                  password: "changeme", 
                  password_confirmation: "changeme" }
end

def find_owner
  @owner ||= Owner.first
end

def create_unconfirmed_owner
  create_visitor
  delete_owner
  sign_up
  visit logout_path
end

 def create_owner
  create_visitor
  delete_owner
  @owner = FactoryGirl.create(:owner, @visitor)
  @owner.confirm!
end

def delete_owner
  @owner ||= Owner.where(:email => @visitor[:email]).first
  @owner.destroy unless @owner.nil?
end

#do i need this method at all?
def sign_up
  delete_owner
  visit '/signup'
  fill_in "owner_firstname", :with => @visitor[:first_name]
  fill_in "owner_lastname", :with => @visitor[:last_name]  
  fill_in "owner_email", :with => @visitor[:email]
  fill_in "owner_password", :with => @visitor[:password]
  fill_in "owner_password_confirmation", :with => @visitor[:password_confirmation]
  click_button "Sign up"
  find_owner
end

def login
  visit login_path
  fill_in "owner_email", :with => @visitor[:email]
  fill_in "owner_password", :with => @visitor[:password]
  click_button "Login"
end

def create_business
  @business = @owner.businesses.create!(name: "My Great Business", description: "Cool business, huh?")
end

def create_business_form
  click_link "Add your business now!"
  fill_in "business_name", with: "Working As Intended"
  fill_in "business_description", with: "Comrade"
  click_button "Submit my business information"
end

def create_two_customers
  @business.customers.create!(first_name: "Art", last_name: "Mills", email: "art@email.com", phones_attributes: [number: "6123333333"])
  @business.customers.create!(first_name: "David", last_name: "Michael", email: "david@email.com", phones_attributes: [number: "6122222222"])
end

 Given(/^I have created a visit for each customer$/) do
   @business.customers.first.visits.create!(visit_notes: "I'm David's customer and my skin is sensitive", date_of_visit: "2014-10-24")
   @business.customers.last.visits.create!(visit_notes: "I'm Art's customer and my skin is sensitive", date_of_visit: "2014-10-24")
 end
 
 Given(/^I have created one package$/) do
  @business.packages.create!(name: "First Customer Package", description: "First package for my customers.", count: "6")
end

Given(/^I have created one deal$/) do
  @customer = Customer.first
  @package = Business.first.packages.first
  @customer.deals.new(date_purchased: "2014-11-13", business_id: 1, used_count: 6, active: true)
  @customer.deals.first.update_attribute(:package_id, @package.id)
  @customer.deals.first.save
end
 
