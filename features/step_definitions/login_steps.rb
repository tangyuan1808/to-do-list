Given(/^I visit the user login page$/) do
  LoginPage.visit
end

When(/^I fill login email with '(.*)'$/) do |email|
  LoginPage.email = email
end

When(/^I fill login password with '(.*)'$/) do |password|
  LoginPage.password = password
end
