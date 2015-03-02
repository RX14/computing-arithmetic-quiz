class Quiz < Sequel::Model
    many_to_one :student

    def questions
        if @questions.nil?
            json = JSON.parse(super)
            json.each do |id, question|
                json[id] = $Question.read(question)
            end

            @questions = json
        end
        @questions
    end

    def questions=(questions)
        case questions
        when Hash
            @questions = JSON.generate(questions)
        when Array
            # Hash of Array index to Array value
            enumerated = Hash[[*questions.map.with_index]].invert
            @questions = JSON.generate(enumerated)
        else
            fail "questions was neither a Hash or an Array"
        end
        super(@questions)
    end

    def answers
        if @answers.nil?
            json = JSON.parse(super)
            json.each do |id, answer|
                json[id] = answer.to_i
            end

            @answers = json
        end
        @answers
    end

    def answers=(answers)
        case answers
        when Hash
            @answers = JSON.generate(answers)

        when Array
            # Hash of Array index to Array value
            enumerated = Hash[[*answers.map.with_index]].invert
            @answers = JSON.generate(enumerated)
        else
            fail "answers was neither a Hash or an Array"
        end
        super(@answers)
    end

    def q_to_a_map
        if @q_to_a_map.nil?
            @q_to_a_map = Hash[
                questions.map do |index, question|
                    [question, answers[index]]
                end
            ]
        end
        @q_to_a_map
    end

    def score
        if @score.nil?
            @score = q_to_a_map.select { |question, answer| question.result == answer }.count
        end
        @score
    end
end
