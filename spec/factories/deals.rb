# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :deal do
    customer nil
    date_purchased "2014-11-11"
    date_completed "2014-11-11"
    used_count 1
  end
end