Task 2
======
The teacher wants to keep track of the scores each member of the class contains
in the quiz. There are three classes in the school and the data should be kept
separately for each class.

Requirements
------------
- Track which students have which Quiz
  - Already done in task 1
- Track which students are in which class
  - Already done in task 1
- Track the students of each test
  - Already done in task 1

Design
------
- SQLite database
- Table for Students
- Table for Quizzes
- Each Student is stored with an ID, first name, last name and class.
- Each quiz is an entry in the Quiz table with a numeric ID and a reference to the student ID
- It is only possible to retrieve this data by opening this database in a sqlite viewer.
