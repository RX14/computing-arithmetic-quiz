class Student < Sequel::Model
    one_to_many :quizzes

    def name
        firstname + " " + lastname
    end
end
