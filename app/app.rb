module ComputingArithmeticQuiz
    class App < Padrino::Application
        register SassInitializer
        register Padrino::Helpers

        enable :sessions
    end
end
