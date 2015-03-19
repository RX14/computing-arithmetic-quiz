ComputingArithmeticQuiz::App.controllers :quiz do
    get :index do
        @title = "Quiz"
        render "quiz/index"
    end

    get :start do
        halt 400, "First Name not given" if params[:firstname].nil?
        halt 400, "Last Name not given" if params[:lastname].nil?
        halt 400, "Class not given" if params[:class].nil?
        halt 400, "Class `all` not allowed" if params[:class] == "all"

        @student = Student.find_or_create firstname: params[:firstname],
                                          lastname:  params[:lastname],
                                          class:     params[:class]

        @quiz = Quiz.create questions: $Question.get(10),
                            student: @student

        redirect to("/quiz/show/#{@quiz.id}")
    end

    get :show, with: :id do
        @quiz = Quiz[params[:id]]

        halt 404, "This Quiz does not exist" if @quiz.nil?
        halt 410, "This Quiz has already been completed" if @quiz.finished

        @title = "Quiz"
        render "quiz/quiz"
    end

    get :finish do
        @quiz = Quiz[params[:id]]

        halt 404, "This Quiz does not exist" if @quiz.nil?
        halt 410, "This Quiz has already been completed" if @quiz.finished

        @quiz.answers = Hash[
            @quiz.questions.map do |index, question|
                halt 400, "Answer to #{question} not given" if params[index].nil?
                [index, params[index]]
            end
        ]

        @quiz.finished = true

        @quiz.save

        redirect to("/quiz/results/#{@quiz.id}")
    end

    get :results, with: :id do
        @quiz = Quiz[params[:id]]

        halt 404, "This Quiz does not exist" if @quiz.nil?
        halt 400, "This Quiz has not yet been completed" unless @quiz.finished

        @title = "Results"
        render "quiz/results"
    end
end
