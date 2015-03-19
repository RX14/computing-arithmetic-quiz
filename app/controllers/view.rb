require "uri"
ComputingArithmeticQuiz::App.controllers :view do
    get :index do
        @classes = Student.select(:class).distinct.map { |s| s[:class] }

        @title = "Classes"
        render "view/index"
    end

    get :class, with: :class do
        redirect to("/view/class/#{params[:class]}/sort/alphabetical")
    end

    get "/class/:class/sort/:sort" do
        if params[:class] == "all"
            @students = Student.all
        else
            @students = Student.filter(class: params[:class]).all
        end

        case params[:sort]
            when "alphabetical"
                @students.sort_by!(&:lastname)
            when "highest_score"
                @students.sort_by! { |s| s.highest_score.to_f }
                @students.reverse!
            when "average_score"
                @students.sort_by! { |s| s.average_score.to_f }
                @students.reverse!
            else
                pass
        end

        @title = "Class: #{params[:class]}"
        render "view/class"
    end

    get :student, with: :id do
        @student = Student[params[:id]]
        halt 404, "This Student does not exist" if @student.nil?

        @title = "Student: #{@student.name}"
        render "view/student"
    end

    get :test, with: :id do
        @quiz = Quiz[params[:id]]

        halt 404, "This Quiz does not exist" if @quiz.nil?
        halt 400, "This Quiz has not yet been completed" unless @quiz.finished

        @show_back = false

        @title = "Results"
        render "quiz/results"
    end
end
