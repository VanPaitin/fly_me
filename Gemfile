source 'https://rubygems.org'
ruby '2.3.0'
gem "bootstrap-sass"
gem 'cocoon'
gem 'coffee-rails', '~> 4.1.0'
gem 'figaro'
gem 'jbuilder', '~> 2.0'
gem 'jquery-rails'
gem "puma"
gem "omniauth-facebook"
gem "omniauth-google-oauth2"
gem "omniauth-oauth2", "~> 1.3.1"
gem "omniauth-twitter"
gem 'rails', '4.2.4'
gem 'rails_12factor'
gem 'sass-rails', '~> 5.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'turbolinks'
gem 'uglifier', '>= 1.3.0'
gem "websocket-rails"

gem "codeclimate-test-reporter", group: :test, require: nil
gem 'simplecov', :require => false, :group => :test
group :development, :test do
  gem "capybara"
  gem "database_cleaner"
  gem "pry"
  gem "pry-rails"
  gem "rspec-rails"
  gem "selenium-webdriver"
  gem "travis", "1.8.0"
end

group :development do
  gem "letter_opener"
  gem 'spring'
  gem 'sqlite3'
  gem 'web-console', '~> 2.0'
end
group :test do
  gem "factory_girl_rails"
  gem "shoulda-matchers", "~> 3.1"
  gem "chromedriver-helper"
end
group :production do
  gem "pg", "0.17.1"
end
