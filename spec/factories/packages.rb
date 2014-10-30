# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :package do
    name "MyString"
    description "MyText"
    count 1
    date_purchased "2014-10-30"
    business nil
  end
end
