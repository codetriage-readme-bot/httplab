source 'https://rubygems.org'

ruby File.read(File.join(File.dirname(__FILE__), '.ruby-version')).strip

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.2'
# Use PostgreSQL as the database for Active Record
gem 'pg', '~> 0.20.0'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
gem 'bcrypt-ruby'
# Authentication engine
gem 'devise', '~> 4.3.0'
# Slim for templates
gem 'slim', '~> 3.0.7'
gem 'slim-rails', '~> 3.1.0'
# Authorization policies
gem 'pundit', '~> 1.1.0'
# API authentication
gem 'jwt', '~> 1.5.6'
gem 'knock', '~> 2.1.1'
# enable cross-origin resource sharing
gem 'rack-cors', '~> 0.4.1', require: 'rack/cors'
# Documentation
gem 'rspec_api_documentation'
# Staticstic
gem 'chartkick'
gem 'groupdate'
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development, :test do
  gem 'factory_girl_rails', '~> 4.8.0'
  gem 'rspec-rails', '~> 3.6.0'
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'chromedriver-helper'
  gem 'selenium-webdriver'
  # Screenshot all failures
  gem 'capybara-screenshot', '~> 1.0.14'
  # Fake values generator
  gem 'faker', '~> 1.7.3'
  # Pretty printed test output
  gem 'shoulda-matchers', '~> 3.1.1'
  gem 'turn', '~> 0.9.6', require: false
  # gem 'rspec-context-private'
  gem 'rails-controller-testing', '~> 1.0.2'
  # Run tests with clean database
  gem 'database_cleaner', '~> 1.5.3'
  # Generate code coverate reports
  gem 'simplecov', '~> 0.13.0', require: false
  gem 'codecov', require: false, group: :test
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Very informative error pages with console
  gem 'better_errors', '~> 2.1.1'
  # Insert console everywhere it's required
  gem 'binding_of_caller', '~> 0.7.2'
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
