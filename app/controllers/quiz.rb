ComputingArithmeticQuiz::App.controllers :quiz do
    $Question = ::ComputingArithmeticQuiz::App::QuizHelper::Question

    get :index do
        @title = "Quiz"
        render "quiz/index"
    end

    get :start do
        @questions = $Question.get(10)

        @quiz = Quiz.create questions: Hash[[*@questions.map.with_index]].invert,

        Student.find_or_create(firstname: params[:firstname],
                               lastname:  params[:lastname],
                               class:     params[:class]).add_quiz(@quiz)

        redirect to("/quiz/show/#{@quiz.id}")
    end

    get :show, with: :id do
        @quiz = Quiz[params[:id]]

        @questions_map = @quiz.questions

        @title = "Quiz"
        render "quiz/quiz"
    end

    get :finish do
        @quiz = Quiz[params[:id]]

        @questions_map = @quiz.questions

        @quiz.answers = Hash[
            @questions_map.map do |index, _|
                [index, params[index]]
            end
        ]

        @quiz.save

        redirect to("/quiz/results/#{@quiz.id}")
    end

    get :results, with: :id do
        @quiz = Quiz[params[:id]]

        @questions_map = @quiz.questions
        @answers_map = @quiz.answers

        @questions = Hash[
            @questions_map.map do |index, question|
                [$Question.read(question), @answers_map[index].to_i]
            end
        ]

        @score = @questions.select { |question, answer| question.result == answer }.count

        @title = "Results"
        render "quiz/results"
    end
end
