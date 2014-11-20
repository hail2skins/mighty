# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :service do
    name "MyString"
    description "MyText"
    price "9.99"
    business nil
  end
end
