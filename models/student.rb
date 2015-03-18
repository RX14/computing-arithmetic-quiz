class Student < Sequel::Model
    one_to_many :quizzes

    def name
        firstname + " " + lastname
    end

    def completed_quizzes
        self.quizzes.select(&:finished)
    end

    def average_score
        return if completed_quizzes.empty?

        completed_quizzes.reduce(0.0) { |sum, quiz| sum + quiz.score.to_i } / self.quizzes.size
    end

    def highest_score
        return if completed_quizzes.empty?

        completed_quizzes.max_by(&:score).score
    end
end
