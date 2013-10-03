source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# Angular
gem 'angularjs-rails'

# helper for handling of CSRF token
gem 'ng-rails-csrf'

# Sass mixin library Bourbon
gem 'bourbon'

# For using ActiveModel's 'has_secure_password'
gem 'bcrypt-ruby', '~> 3.0.0', require: 'bcrypt'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Switch from SQLite to PostgreSQL for deployment to Heroku
# Based on http://railsapps.github.com/rails-heroku-tutorial.html
group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
  gem 'rspec-rails', '~> 2.14.0'
  gem 'factory_girl_rails', '~> 4.2.1'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'spork-rails'
end

group:test do
  gem 'faker', '~> 1.1.2'
  gem 'capybara', '~> 2.1.0'
  gem 'database_cleaner', '~> 1.0.1'
  gem 'launchy', '~> 2.3.0'
  gem 'selenium-webdriver', '~> 2.35.1'
end

group :production do
  gem 'pg'
  gem 'thin'
end

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# Debugging
gem 'debase', '~> 0.0.7'
gem 'ruby-debug-ide', '~> 0.4.18'
#gem 'coffee-script-redux-debugger', :git => 'git://github.com/JetBrains/coffee-script-redux-debugger.git'

# TODO: Check if this sources are deprecated with Angular 1.2.0
gem 'angularjs-rails-resource', '~> 0.2.0'