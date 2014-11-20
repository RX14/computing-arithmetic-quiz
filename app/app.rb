module ComputingArithmeticQuiz
    class App < Padrino::Application
        register SassInitializer
        register Padrino::Helpers

        configure :development do
            use BetterErrors::Middleware
            BetterErrors.application_root = PADRINO_ROOT
        end
    end
end
