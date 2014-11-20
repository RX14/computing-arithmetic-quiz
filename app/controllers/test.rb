ComputingArithmeticQuiz::App.controllers :test do
    layout :base

    get :index do
        @title = "Test"
        render "test/index"
    end
end
