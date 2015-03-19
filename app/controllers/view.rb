ComputingArithmeticQuiz::App.controllers :view do
    get :index do
        @classes = Student.select(:class).distinct.map { |s| s[:class] }

        @title = "Classes"
        render "view/index"
    end

    get "/class/:class/sort/:sort" do
        @students = Student.filter(class: params[:class]).all

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

        @title = "Student: #{@student.name}"
        render "view/student"
    end
end
