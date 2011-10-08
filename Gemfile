source 'http://rubygems.org'

gem 'rails', '3.1.0'
gem 'pg'
gem 'haml'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

group :development, :test do
  gem "rspec-rails", ">= 2.6.1"
  gem 'ruby-debug19', :require => 'ruby-debug'
  gem "silent-postgres", "~> 0.0.8"
end

group :test do
  gem "capybara"
  gem "factory_girl_rails"
  gem "shoulda", '>= 3.0.0.beta2'
  gem "fuubar", "~> 0.0.6"
end

group :development do
  gem "nifty-generators"
  gem "haml-rails"
  gem "autotest"
  gem "autotest-rails"
end

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

gem "mocha", :group => :test
