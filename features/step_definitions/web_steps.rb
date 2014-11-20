Given(/^I visit the url "(.*)"$/) do |url|
    visit url
end

Given(/^I fill in "(.*)" for "(.*)"$/) do |value, field|
    fill_in(field, with: value)
end

When(/^I press "(.*)"$/) do |name|
    click_button(name)
end

Then(/^I should see "(.*)"$/) do |text|
    page.should have_content(text)
end

Then(/^I should see (\d+) input boxes$/) do |amount|
    amount = amount.to_i
    result = all('input[type="text"]').count
    fail("Expected #{amount} input boxes, had #{result}.") unless result == amount
end
