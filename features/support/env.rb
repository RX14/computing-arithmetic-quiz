require "simplecov"

RACK_ENV = "test" unless defined?(RACK_ENV)
require File.expand_path(File.dirname(__FILE__) + "/../../config/boot")
Dir[File.expand_path(File.dirname(__FILE__) + "/../app/helpers/**/*.rb")].each(&method(:require))

require "capybara/cucumber"
require "rspec/expectations"

Capybara.app = Padrino.application

require "database_cleaner"
require "database_cleaner/cucumber"

Around do |_, block|
    DatabaseCleaner.cleaning(&block)
end
