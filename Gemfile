source "https://rubygems.org"

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'closure-compiler'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end

# Switch from SQLite to PostgreSQL for deployment to Heroku
# http://railsapps.github.com/rails-heroku-tutorial.html
group :development, :test do
  gem 'sqlite3'
end
group :production do
  gem 'pg'
  gem 'thin'
end

