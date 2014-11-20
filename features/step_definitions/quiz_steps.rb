Given(/^a test$/) do
    steps %(
        Given I visit the url "/quiz"
        And I fill in "Test" for "firstname"
        And I fill in "User" for "lastname"
        And I press "Start Test"
    )
end

Then(/^I should see (\d+) questions$/) do |amount|
    pending
end

Given(/^I have filled out the test correctly$/) do
    pending
end
