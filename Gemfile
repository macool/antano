ruby "2.0.0"

source "https://rubygems.org"

# Bundle edge Rails instead: gem "rails", github: "rails/rails"
gem "rails", "4.1.0"

# Use mysql as the database for Active Record
gem "mysql2"

# Use SCSS for stylesheets
gem "sass-rails", "~> 4.0.0"

# Use Uglifier as compressor for JavaScript assets
gem "uglifier", ">= 1.3.0"

# Use CoffeeScript for .js.coffee assets and views
gem "coffee-rails", "~> 4.0.0"

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem "therubyracer", platforms: :ruby

# Use jquery as the JavaScript library
gem "jquery-rails"

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem "turbolinks"

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 1.2"

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem "sdoc", require: false
end

# Use ActiveModel has_secure_password
# gem "bcrypt-ruby", "~> 3.1.2"

# Use unicorn as the app server
gem "puma"

# Use Capistrano for deployment
# gem "capistrano", group: :development

# Use debugger
# gem "debugger", group: [:development, :test]

gem "slim-rails"
gem "kaminari"
gem "foreman"
gem "dotenv"
gem "omniauth-twitter"
gem "omniauth-facebook"
gem "draper"
gem "decent_exposure"
gem "decent_decoration"
gem "carrierwave"
gem "cloudinary"
gem "simple_form"
gem "twitter", "4.8.0"
gem "sentry-raven", :git => "https://github.com/getsentry/raven-ruby.git"
gem "skylight"

group :test, :development do
  gem "rspec-rails"
  gem "factory_girl_rails"
  gem "capybara"
  gem "guard-rspec"
  gem "terminal-notifier-guard"
  gem "pry-rails"
end

group :development do
  gem "rack-mini-profiler"
  gem "bullet"
  gem "better_errors"
  gem "binding_of_caller"
  gem "meta_request"
  gem "spring"
end

group :production do
  gem "rails_12factor"
end
