When(/^I click submit$/) do
  PageObject.submit
end

Then(/^I should see a success message$/) do
  expect(PageObject.has_notice?).to eq true
end

Then(/^I should see a error message$/) do
  expect(PageObject.has_alert?).to eq true
end

And(/^I should be redirected to login page$/) do
  sleep(0.5)
  expect(PageObject.current_page).to eq(login_path)
end

And(/^I should stay on login page$/) do
  expect(PageObject.current_page).to eq(sessions_path)
end

And(/^I should stay on signup page$/) do
  expect(PageObject.current_page).to eq(users_path)
end

And(/^I should be redirected to list index page$/) do
  expect(PageObject.current_page).to eq(lists_path)
end

When(/^I click on logout link$/) do
  PageObject.logout
end
