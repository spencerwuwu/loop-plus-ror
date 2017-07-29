source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.2'
gem 'sqlite3'
gem 'puma', '~> 3.7'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'therubyracer', platforms: :ruby
gem "slim-rails", '3.1.1'
gem 'webpacker', '~> 2.0'
gem 'jquery-rails'
gem 'awesome_rails_console', "~> 0.4.0"
gem 'turbolinks'
gem 'settingslogic', "~> 2.0.9"
gem 'mini_magick', "~> 4.6.0"
gem 'carrierwave', '~> 1.0'
gem 'ckeditor', github: 'galetahub/ckeditor'
gem 'administrate', github: 'thoughtbot/administrate'
gem 'ruby-units', '~> 2.1.0'

# User
gem 'devise', "~> 4.3.0"
gem 'rolify', "~> 5.1.0"
gem 'cancancan', "~> 2.0.0"

# Use for validate django's user
gem 'pbkdf2_password_hasher', "~> 0.2.0"

# Sass framework
gem 'sass-rails', '~> 5.0'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
