When /^I need to see the page$/ do
  save_and_open_screenshot
end

When /^I need to see the full page$/ do
  save_and_open_screenshot('screen.png', full: true)
end

When(/^I need a debugger$/) do
  binding.pry
end
