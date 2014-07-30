source 'https://rubygems.org'

gem 'rails', '4.1.4'
gem 'pg'

# assets
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'

# functional
gem 'viddl-rb'
gem 'carrierwave'
gem 'faye'
gem 'sidekiq'

# layout
gem 'slim-rails'
gem 'simple_form'
gem 'draper'

# helpers
gem 'figaro', git: 'git@github.com:laserlemon/figaro.git'
gem 'foreman'

group :development do
  gem 'capistrano-rails'
  gem 'spring'

  gem 'thin'
  gem 'quiet_assets'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'fabrication'
end

group :test do
  gem 'database_cleaner'
  gem 'webmock'
end

group :production do
  gem 'unicorn'
end
