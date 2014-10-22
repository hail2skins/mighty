# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :customer do
    first_name "MyString"
    middle_name "MyString"
    last_name "MyString"
    phone 1
    referred_by "MyString"
    business nil
  end
end
