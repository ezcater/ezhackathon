# frozen_string_literal: true

ruby "~> 2.7.4"
source "https://ezcater.jfrog.io/ezcater/api/gems/ezcater-gem-source"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "ezcater_apm"
gem "ezcater_errors"
gem "ezcater_feature_flag-client", ">= 0.6.0"
gem "ezcater_http"
gem "ezcater_metrics"
gem "ezcater_migrations", ">= 0.9.0"
gem "ezcater_trusted_proxies-rails"
gem "ice_nine", require: ["ice_nine", "ice_nine/core_ext/object"]
gem "lograge"
gem "private_attr", require: "private_attr/everywhere"
gem "rails", "~> 6.0.3", ">= 6.0.3.7"
gem "required_env_fetcher"
gem "sprockets"
gem "sprockets-rails", require: "sprockets/railtie"
# Use postgresql as the database for Active Record
gem "pg", ">= 0.18", "< 2.0"
# Use Puma as the app server
gem "puma", "~> 4.1"
# Use SCSS for stylesheets
gem "sass-rails", ">= 6"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# Use Active Storage variant
# gem 'image_processing', '~> 1.2'
# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.2", require: false

group :development, :test do
  gem 'capybara'
  gem "dotenv-rails"
  gem "ezcater_rubocop", ">= 0.52.7", require: false
  gem "factory_bot_rails"
  gem "pry-byebug"
  gem "pry-rails"
  gem "rspec-rails"
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: %i(mri mingw x64_mingw)
end

group :development do
  gem "aws-sdk-s3", require: false
  gem "ezcater_docker_shared"
  gem "ezk", require: false
  gem "foreman", require: false
  gem "overcommit", require: false
  gem "spring-commands-rspec"
  gem "spring-commands-rubocop"
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem "listen", "~> 3.2"
  gem "web-console", ">= 3.3.0"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "ezcater_matchers"
  gem "rspec_junit_formatter"
  gem "shoulda-matchers"
  gem "simplecov", require: false
  gem "webmock"
end
