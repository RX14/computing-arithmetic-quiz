require "coveralls"
require "codeclimate-test-reporter"
require "simplecov-summary"

SimpleCov.start do
    formatter SimpleCov::Formatter::SummaryFormatter

    add_filter "/config/"
    add_filter "/spec/"
    add_filter "/features/"
    add_filter "/vendor/"
    add_filter "/lib/sass_initializer.rb"
    add_filter "/lib/better_errors.rb"

    add_group "app:controllers", "app/controllers"
    add_group "app:helpers", "app/helpers"
    add_group "app:app", "app/app.rb"
end
