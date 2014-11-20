ComputingArithmeticQuiz::App.controllers :quiz do
    get :index do
        @title = "Quiz"
        render "quiz/index"
    end

    get :start do
        @name = params[:firstname] + " " + params[:lastname]
        @title = "Quiz"
        render "quiz/quiz"
    end
end
