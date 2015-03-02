class Quiz < Sequel::Model
    many_to_one :student

    def questions
        JSON.parse(super)
    end

    def questions=(questions)
        super(JSON.generate(questions))
    end

    def answers
        JSON.parse(super)
    end

    def answers=(answers)
        super(JSON.generate(answers))
    end
end
