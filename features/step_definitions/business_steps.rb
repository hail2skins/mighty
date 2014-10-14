#Added for business_creates_customers.feature
Given(/^I have follow prompts to add a business$/) do
  create_business_form
end

Then(/^I expect to see content "(.*?)"$/) do |content|
  expect(page).to have_content(content)
end

Then(/^I expect to see a link to "(.*?)"$/) do |link|
  expect(page).to have_link(link)
end

Then(/^I expect to see a form to add customer information$/) do
  expect(page).to have_css('form', text: "")
end

Then(/^I expect to see a header with "(.*?)"$/) do |header|
  expect(page).to have_css('h1', header)
end

Then(/^I expect to see the title "(.*?)"$/) do |title|
  expect(page).to have_title(title)
end

Then(/^I expect to not see content "(.*?)"$/) do |content|
  expect(page).to_not have_content(content)
end

Then(/^I expect the page to have a table$/) do
  expect(page).to have_selector('table')
end