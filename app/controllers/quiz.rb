ComputingArithmeticQuiz::App.controllers :quiz do
    get :index do
        @title = "Quiz"
        render "quiz/index"
    end

    get :start do
        @quiz = Quiz.create questions: $Question.get(10)

        Student.find_or_create(firstname: params[:firstname],
                               lastname:  params[:lastname],
                               class:     params[:class]).add_quiz(@quiz)

        redirect to("/quiz/show/#{@quiz.id}")
    end

    get :show, with: :id do
        @quiz = Quiz[params[:id]]

        @title = "Quiz"
        render "quiz/quiz"
    end

    get :finish do
        @quiz = Quiz[params[:id]]

        @quiz.answers = Hash[
            @quiz.questions.map do |index, _|
                [index, params[index]]
            end
        ]

        @quiz.save

        redirect to("/quiz/results/#{@quiz.id}")
    end

    get :results, with: :id do
        @quiz = Quiz[params[:id]]

        @title = "Results"
        render "quiz/results"
    end
end
