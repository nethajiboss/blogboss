Given /^I am in sample page$/ do
  visit '/samples/new'
end
Then /^I should see "([^"]*)" button/ do |name|
  find_button(name)
end