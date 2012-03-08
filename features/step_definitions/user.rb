Given /^I am in user page$/ do
  visit '/user/new'
end
Then /^I should see "([^"]*)" button/ do |name|
  find_button(name)
end