source "https://rubygems.org"

# Padrino Stable Gem
gem "padrino", "0.12.4"

# Project requirements
gem "rake"

# Component requirements
gem "sass"
gem "haml"
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

    gem "simplecov", "0.9.1", require: false
    gem "coveralls", "0.7.1", require: false
    gem "codeclimate-test-reporter", "0.4.1", require: false
    gem "simplecov-summary", require: false, github: "inossidabile/simplecov-summary", ref: "e140ad"
end

# Server
group "development", "production" do
    gem "puma"
end
