# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.5.1"
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
# Use ActiveModel has_secure_password
gem "active_model_serializers"
gem "bcrypt", "~> 3.1.7"
gem "bootstrap-sass", "3.4.1"

# Use CoffeeScript for .coffee assets and views
gem "coffee-rails", "~> 4.2"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "puma", "~> 3.11"
# Use SCSS for stylesheets
gem "rails", "~> 5.2.3"
# Use sqlite3 as the database for Active Record
gem "sass-rails", "~> 5.0"
# Use Uglifier as compressor for JavaScript assets
gem "sqlite3"
# Use Puma as the app server
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.1.0", require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to
  # stop execution and get a debugger console
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "factory_bot_rails"
  gem "pry"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "rubocop"
  # Spring speeds up development by keeping your application
  # running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  # Access an interactive console on exception pages
  # or by calling 'console' anywhere in the code.
  gem "web-console", ">= 3.3.0"
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem "capybara", ">= 2.15"
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem "chromedriver-helper"
  gem "rack_session_access"
  gem "rails-controller-testing"
  gem "rspec"
  gem "rspec-rails"
  gem "selenium-webdriver"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
