require "coveralls/rake/task"
Coveralls::RakeTask.new

require "cucumber/rake/task"
Cucumber::Rake::Task.new(:features) do |t|
    t.profile = "default"
end

task :codeclimate do
    require "simplecov"
    require "codeclimate-test-reporter"
    CodeClimate::TestReporter::Formatter.new.format(SimpleCov.result)
end

task :simplecov_report do
    require "simplecov"
    SimpleCov::Formatter::HTMLFormatter.new.format(SimpleCov.result)
end

task test: [:spec, :features]
task test_coverage: [:test, "coveralls:push", :codeclimate]
task test_report: [:test, :simplecov_report]
