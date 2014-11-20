source "https://rubygems.org"

# Padrino Stable Gem
gem "padrino"

# Project requirements
gem "rake"

# Component requirements
gem "slim"
gem "sass"
gem "sqlite3"
gem "sequel"

# Test requirements
group "test" do
    gem "rspec"
    gem "capybara"
    gem "rack-test", require: "rack/test"
    gem "cucumber"

    # Linter
    gem "rubocop"

    gem "simplecov", require: false
    gem "coveralls", require: false
    gem "codeclimate-test-reporter", require: false
    gem "simplecov-summary", require: false, github: "inossidabile/simplecov-summary"
end

# Server
group "development", "production" do
    gem "puma"
end
