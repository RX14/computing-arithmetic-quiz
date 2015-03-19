Feature: View
  In order to help students learn
  As a teacher
  I want to view students results and mistakes

  Scenario: View classes list
    Given the following students exist:
      | firstname | lastname | class      |
      | Test      | User 1   | TestClass1 |
      | Test      | User 2   | TestClass1 |
      | Test      | User 3   | TestClass2 |
      | Test      | User 4   | TestClass3 |
      | Test      | User 5   | TestClass2 |
      | Test      | User 6   | TestClass1 |
    When I visit the url "/view"
    Then I should see "TestClass1"
    And  I should see "TestClass2"
    And  I should see "TestClass3"
