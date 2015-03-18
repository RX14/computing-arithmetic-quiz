ComputingArithmeticQuiz::App.controllers :view do

    get :index do
        @classes = Student.select(:class).distinct.map { |s| s[:class] }

        @title = "Classes"
        render "view/index"
    end

end
