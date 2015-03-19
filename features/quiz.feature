Feature: Quiz
  In order to test my maths skills
  As a student
  I want to be able to take an arithmetic quiz

  Scenario: Collect user info
    Given I visit the url "/quiz"
    And I fill in "Test" for "firstname"
    And I fill in "User" for "lastname"
    And I fill in "Test Class" for "class"
    When I press "Start Test"
    Then I should see "Test User"

  Scenario: Test the user
    Given a test
    Then I should see 10 questions
    Then I should see 10 number input boxes

  Scenario: Validate the results
    Given a test
    And I have filled out the test correctly
    When I press "Submit Test"
    Then I should see "You scored 10/10!"
