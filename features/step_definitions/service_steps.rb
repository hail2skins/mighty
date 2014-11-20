Then(/^I expect to see a form to add a new service$/) do
  expect(page).to have_css(:form, "")
end