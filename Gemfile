source 'https://rubygems.org'

ruby File.read(File.join(File.dirname(__FILE__), '.ruby-version')).strip

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use PostgreSQL as the database for Active Record
gem 'pg', '~> 0.21.0'
# Use Puma as the app server
gem 'puma', '~> 3.9.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0.6'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '~> 3.2.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5.0.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.11'
# Authentication engine
gem 'devise', '~> 4.3.0'
# Slim for templates
gem 'slim', '~> 3.0.8'
gem 'slim-rails', '~> 3.1.2'
# Authorization policies
gem 'pundit', '~> 1.1.0'
# API authentication
gem 'jwt', '~> 1.5.6'
gem 'knock', '~> 2.1.1'
# enable cross-origin resource sharing
gem 'rack-cors', '~> 0.4.1', require: 'rack/cors'
# Documentation
gem 'rspec_api_documentation', '~> 5.0.0'
# Staticstic
gem 'chartkick', '~> 2.2.4'
gem 'groupdate', '~> 3.2.0'
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development, :test do
  gem 'factory_girl_rails', '~> 4.8.0'
  gem 'rspec-rails', '~> 3.6.1'
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.15.1'
  gem 'chromedriver-helper', '~> 1.1.0'
  gem 'selenium-webdriver', '~> 3.5.0'
  # Screenshot all failures
  gem 'capybara-screenshot', '~> 1.0.17'
  # Fake values generator
  gem 'faker', '~> 1.8.4'
  # Pretty printed test output
  gem 'shoulda-matchers', '~> 3.1.2'
  gem 'turn', '~> 0.9.6', require: false
  # gem 'rspec-context-private'
  gem 'rails-controller-testing', '~> 1.0.2'
  # Run tests with clean database
  gem 'database_cleaner', '~> 1.6.1'
  # Generate code coverate reports
  gem 'codeclimate-test-reporter', '~> 1.0.8', require: false
  gem 'coveralls', '~> 0.7.2', require: false
  gem 'codecov', '~> 0.1.10', require: false
  gem 'simplecov', '~> 0.13.0', require: false
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Very informative error pages with console
  gem 'better_errors', '~> 2.3.0'
  # Insert console everywhere it's required
  gem 'binding_of_caller', '~> 0.7.2'
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '~> 3.1.5'
  gem 'web-console', '~> 3.5.1'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 2.0.2'
  gem 'spring-watcher-listen', '~> 2.0.1'
end
