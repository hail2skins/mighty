# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :visit do
    visit_notes "MyText"
    date_of_visit "2014-10-24"
    customer nil
  end
end
