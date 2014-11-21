ComputingArithmeticQuiz::App.controllers :quiz do
    get :index do
        @title = "Quiz"
        render "quiz/index"
    end

    get :start do
        @firstname = params[:firstname]
        @lastname = params[:lastname]
        @name = @firstname + " " + @lastname

        @questions = ::ComputingArithmeticQuiz::App::QuizHelper::Question.get(10)

        @title = "Quiz"
        render "quiz/quiz"
    end

    get :finish do
        @firstname = params.delete "firstname"
        @lastname = params.delete "lastname"
        @name = @firstname + " " + @lastname

        @score = 0
        @questions = {}
        params.each do |q, a|
            question = ::ComputingArithmeticQuiz::App::QuizHelper::Question.read(q)
            @questions[question] = a.to_i

            @score += 1 if question.result == a.to_i
        end

        @title = "Results"
        render "quiz/results"
    end
end
