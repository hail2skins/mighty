#Added for business_creates_customers.feature
Then(/^I expect to see content "(.*?)"$/) do |content|
  expect(page).to have_content(content)
end

Then(/^I expect to see a link to "(.*?)"$/) do |link|
  expect(page).to have_link(link)
end

Then(/^I am at the create new customer page$/) do
  expect current_path == new_business_customer_path(@business)
end

Then(/^I expect to see a form to add customer information$/) do
  expect(page).to have_css('form', text: "")
end

Then(/^I expect to see the title "(.*?)"$/) do |title|
  pending # express the regexp above with the code you wish you had
end

When(/^I click the "(.*?)" button$/) do |button|
  pending # express the regexp above with the code you wish you had
end

Then(/^I expect to not see content "(.*?)"$/) do |content|
  pending # express the regexp above with the code you wish you had
end