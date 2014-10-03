source 'https://rubygems.org'

gem 'rails', '4.1.6'
gem 'sqlite3'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'spring', group: :development

gem 'mysql2'
gem 'devise'
gem 'nokogiri'
gem "paperclip", "~> 4.2"
gem "jquery-fileupload-rails"
gem 'contentflow'
gem 'x-editable-rails'
gem "select2-rails"
gem 'haml'
gem 'html2haml'

group :development, :test do
	gem 'rspec-rails'
  	gem 'pry-rails'
  	gem 'awesome_print'
  	gem "factory_girl_rails", "~> 4.4.1"#, :require => false
end

group :deployment do
	gem 'capistrano', '~> 3.2.0'
	gem 'capistrano-ext'
	gem 'capistrano-rvm'
	gem 'capistrano-bundler'
	gem 'capistrano-rails'
	gem 'rvm-capistrano'
	gem 'capistrano-maintenance', github: "capistrano/maintenance", require: false
end

group :test do
	gem "faker", "~> 1.3.0"
	gem "capybara", "~> 2.3.0"
	gem "database_cleaner", "~> 1.3.0"
	gem 'selenium-webdriver'
	gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
	gem "launchy", "~> 2.4.2"
	gem 'guard-rspec'
	gem 'guard-spring'
	gem 'spring-commands-rspec'
	gem "codeclimate-test-reporter", require: nil
end

gem 'execjs'
gem 'therubyracer'


