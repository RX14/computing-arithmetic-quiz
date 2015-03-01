ComputingArithmeticQuiz::App.controllers :quiz do
    $Question = ::ComputingArithmeticQuiz::App::QuizHelper::Question

    get :index do
        @title = "Quiz"
        render "quiz/index"
    end

    get :start do
        @questions = $Question.get(10)

        @quiz = Quiz.create questions: JSON.generate(Hash[[*@questions.map.with_index]].invert),
                            finished: false

        Student.find_or_create(firstname: params[:firstname],
                               lastname:  params[:lastname],
                               class:     params[:class]).add_quiz(@quiz)

        redirect to("/quiz/show/#{@quiz.id}")
    end

    get :show, with: :id do
        @quiz = Quiz[params[:id]]

        @questions_map = JSON.parse(@quiz.questions)

        @title = "Quiz"
        render "quiz/quiz"
    end

    get :finish do
        @quiz = Quiz[params[:id]]

        @questions_map = JSON.parse(@quiz.questions)

        @quiz.answers = JSON.generate Hash[
            @questions_map.map do |index, _|
                [index, params[index]]
            end
        ]

        @quiz.save

        redirect to("/quiz/results/#{@quiz.id}")
    end

    get :results, with: :id do
        @quiz = Quiz[params[:id]]

        @questions_map = JSON.parse(@quiz.questions)

        @questions = Hash[
            @questions_map.map do |index, question|
                [$Question.read(question), params[index].to_i]
            end
        ]

        @score = @questions.select { |question, answer| question.result == answer }.count

        @title = "Results"
        render "quiz/results"
    end
end
