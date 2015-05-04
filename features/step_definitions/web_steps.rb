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

Then(/^I should see (\d+) (.*) input boxes$/) do |amount, type|
    amount = amount.to_i
    result = all("input[type=\"#{type}\"]").count
    fail("Expected #{amount} #{type} input boxes, had #{result}.") unless result == amount
end

Then(/^I should see the table:$/) do |expected_table|
    html_table = first("table").all("tr").map do |tr|
        tr.all("th, td").map { |td| td.text.gsub(/<.+?>/, "").gsub(/[\n\t\r]/, "") }
    end
    expected_table.diff!(html_table, surplus_col: true, misplaced_col: true)
end
