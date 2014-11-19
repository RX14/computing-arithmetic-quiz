require "coveralls"
require "codeclimate-test-reporter"
require "simplecov-summary"

SimpleCov.start do
    formatter SimpleCov::Formatter::MultiFormatter[
        Coveralls::SimpleCov::Formatter,
        CodeClimate::TestReporter::Formatter,
        SimpleCov::Formatter::SummaryFormatter
    ]

    add_filter "/config/"
    add_filter "/features/"

    add_group "app:controllers", "app/controllers"
    add_group "app:helpers", "app/helpers"
    add_group "app:app", "app/app.rb"
end
