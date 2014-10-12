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
  @business = @owner.businesses.create(name: "My Great Business", description: "Cool business, huh?")
end

def set_business
  @business = @owner.businesses.where(selected: true).first
  @business.id = params[:business_id]
end
