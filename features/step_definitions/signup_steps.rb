Given(/^I visit the user sign up page$/) do
  SignupPage.visit
end

And(/^I fill name with '(.*)'$/) do |name|
  SignupPage.name = name
end

And(/^I fill email with '(.*)'$/) do |email|
  SignupPage.email = email
end

And(/^I fill password with '(.*)'/) do |password|
  SignupPage.password = password
end

And(/^I fill password confirmation with '(.*)'/) do |password_confirmation|
  SignupPage.password_confirmation = password_confirmation
end
