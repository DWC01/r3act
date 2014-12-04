source 'https://rubygems.org'
ruby '2.0.0'
gem 'rails', '4.1.0'
gem 'pg'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem "bootstrap-sass"
gem 'jquery-rails'
gem 'sdoc', '~> 0.4.0', group: :doc

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem "meta_request"
  gem 'quiet_assets'
  gem 'rails_layout'
  ### Test
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'spork-rails', github: 'sporkrb/spork-rails'
  gem 'rb-fsevent'
end

group :development, :test do
  gem "rspec-rails"
  gem "factory_girl_rails"
end

group :production do
  gem 'rails_12factor'
  gem 'unicorn'
end

group :test do
  gem "faker"
  gem "capybara"
  gem "database_cleaner"
  gem "launchy"
  gem "shoulda-matchers"
end