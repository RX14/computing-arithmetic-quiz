ComputingArithmeticQuiz::App.controllers :quiz do
    get :index do
        @title = "Quiz"
        render "quiz/index"
    end

    get :start do
        @questions = ::ComputingArithmeticQuiz::App::QuizHelper::Question.get(10)

        @student = Student.find_or_create firstname: params[:firstname],
                                          lastname: params[:lastname],
                                          class: params[:class]

        @quiz = Quiz.create questions: JSON.generate(@questions), finished: false

        @student.add_quiz @quiz

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
