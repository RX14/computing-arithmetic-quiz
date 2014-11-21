module ComputingArithmeticQuiz
    class App < Padrino::Application
        register SassInitializer
        register Padrino::Helpers

        # :nocov:
        configure :development do
            use BetterErrors::Middleware
            BetterErrors.application_root = PADRINO_ROOT
        end
        # :nocov:
    end
end
