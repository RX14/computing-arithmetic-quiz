class Student < Sequel::Model
    one_to_many :quizzes

    def name
        firstname + " " + lastname
    end

    def completed_quizzes
        quizzes.select(&:finished)
    end

    def average_score
        return if completed_quizzes.empty?

        completed_quizzes.reduce(0.0) { |a, e| a + e.score.to_i } / quizzes.size
    end

    def highest_score
        return if completed_quizzes.empty?

        completed_quizzes.max_by(&:score).score
    end
end
