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
    gem "rubocop"

    # Linter
end

# Server
group "development", "production" do
    gem "puma"
end
