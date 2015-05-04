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

Given(/^the following quizzes exist for the student "(.+)":$/) do |user, table|
    table = table.hashes
    table.each do |row|
        questions = {}
        answers = {}

        if row["score"].nil?
            i = 1
            loop do
                question_str = "Q#{i}"
                break if row[question_str].nil?

                question, answer = row[question_str].split("=")

                questions[i] = question
                answers[i] = answer

                i += 1
            end
        else
            score, total = row["score"].split("/")
            score = score.to_i

            total.to_i.times do |i|
                questions[i] = "0+0"
                if score > 0
                    answers[i] = "0"
                else
                    answers[i] = "1"
                end

                score -= 1
            end
        end

        Quiz.create finished: row["finished"] == "true",
                    questions: questions,
                    answers: answers,
                    student: Student.each { |s| break s if s.name == user }
    end
end
