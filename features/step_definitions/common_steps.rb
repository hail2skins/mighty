When(/^I click the "(.*?)" link$/) do |link|
  click_link link
end

Given(/^I should see a link to "(.*?)"$/) do |link|
  page.should have_link(link)
end

Then(/^I should see content "(.*?)"$/) do |content|
  page.should have_content(content)
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |form, data|
  page.fill_in form, with: data
end

Then(/^when I click the "(.*?)" button$/) do |button|
  click_button(button)
end

Then(/^I should see the title "(.*?)"$/) do |title|
  page.should have_title(title)
end

Then(/^a prompt asks "(.*?)"$/) do |content|
  page.driver.console_messages.first
end

When(/^I accept popup$/) do
  page.driver.accept_js_confirms!
end