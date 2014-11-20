Feature: Test
  In order to test my maths skills
  As a student
  I want to be able to take an arithmetic quiz

  Scenario: Collect user info
    Given I visit the url "/test"
    And I fill in "Test" for "first-name"
    And I fill in "User" for "second-name"
    When I press "Start Test"
    Then I should see "Test User"
