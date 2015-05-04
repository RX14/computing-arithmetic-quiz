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

  Scenario: View a class
    Given the following students exist:
      | firstname | lastname | class     |
      | Test      | User 1   | TestClass |
      | Test      | User 2   | TestClass |
      | Test      | User 3   | TestClass |
    And the following quizzes exist for the student "Test User 1":
      | score | finished |
      | 5/10  | true     |
      | 5/10  | true     |
      | 5/10  | true     |
    And the following quizzes exist for the student "Test User 2":
      | score | finished |
      | 10/10 | true     |
      | 0/10  | true     |
      | 0/10  | true     |
      | 0/10  | true     |
    And the following quizzes exist for the student "Test User 3":
      | score | finished |
      | 0/10  | true     |
      | 0/10  | true     |
      | 0/10  | true     |
      | 0/10  | true     |
    When I visit the url "/view/class/all/"
    Then I should see the table:
      | Last Name | First Name | Class     | Average Score | Highest Score |
      | User 1    | Test       | TestClass | 5.0           | 5             |
      | User 2    | Test       | TestClass | 2.5           | 10            |
      | User 3    | Test       | TestClass | 0.0           | 0             |
    When I visit the url "/view/class/all/sort/highest_score"
    Then I should see the table:
      | Last Name | First Name | Class     | Average Score | Highest Score |
      | User 2    | Test       | TestClass | 2.5           | 10            |
      | User 1    | Test       | TestClass | 5.0           | 5             |
      | User 3    | Test       | TestClass | 0.0           | 0             |
    When I visit the url "/view/class/TestClass/sort/average_score"
    Then I should see the table:
      | Last Name | First Name | Class     | Average Score | Highest Score |
      | User 1    | Test       | TestClass | 5.0           | 5             |
      | User 2    | Test       | TestClass | 2.5           | 10            |
      | User 3    | Test       | TestClass | 0.0           | 0             |

  Scenario: View a student
    Given the following students exist:
      | firstname | lastname | class     |
      | Test      | User 1   | TestClass |
    And the following quizzes exist for the student "Test User 1":
      | score | finished |
      | 10/10 | true     |
      | 0/10  | false    |
      | 5/10  | true     |
    When I visit the url "/view/student/1"
    Then I should see the table:
      | Test ID | Student Name | Finished | Score |
      | 1       | Test User 1  | yes      | 10    |
      | 2       | Test User 1  | no       | 0     |
      | 3       | Test User 1  | yes      | 5     |

  Scenario: View a test
    Given the following students exist:
      | firstname | lastname  | class     |
      | Test      | Student 1 | TestClass |
    Given the following quizzes exist for the student "Test Student 1":
      | score | finished |
      | 10/10 | true     |
    When I visit the url "/view/test/1"
    Then I should see "You scored 10/10!"
