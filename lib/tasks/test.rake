require "coveralls/rake/task"
Coveralls::RakeTask.new

require "cucumber/rake/task"
Cucumber::Rake::Task.new(:features) do |t|
    t.profile = "default"
end

desc "Push latest coverage data to CodeClimate"
task :codeclimate do
    require "simplecov"
    require "codeclimate-test-reporter"
    CodeClimate::TestReporter::Formatter.new.format(SimpleCov.result)
end

desc "Generates a HRML report of SimpleCov data"
task :simplecov_report do
    require "simplecov"
    SimpleCov::Formatter::HTMLFormatter.new.format(SimpleCov.result)
end

desc "Runs all tests"
task test: [:spec, :features]

desc "Runs tests and uploads coverage"
task test_coverage: [:test, "coveralls:push", :codeclimate]

desc "Runs tests and generates a HTML report"
task test_report: [:test, :simplecov_report]
