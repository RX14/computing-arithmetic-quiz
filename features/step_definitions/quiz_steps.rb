Given(/^a test$/) do
    steps %(
        Given I visit the url "/quiz"
        And I fill in "Test" for "firstname"
        And I fill in "User" for "lastname"
        And I fill in "Test Class" for "class"
        And I press "Start Test"
    )
end

Then(/^I should see (\d+) questions$/) do |amount|
    (0..amount.to_i.-(1)).each do |i|
        page.should have_selector("#question_#{i}")
    end
end

Given(/^I have filled out the test correctly$/) do
    (0..9).each do |i|
        text = find("label[for=\"question_#{i}_input\"]").text.strip
        question = $Question.read(text)
        find("input#question_#{i}_input").set(question.result)
    end
end
