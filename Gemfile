source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.8", ">= 7.0.8.4"

gem "pg", "~> 1.1"

gem "puma", "~> 5.0"

gem 'dotenv-rails', groups: %i[development test]

gem 'httparty'

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

gem "bootsnap", require: false

gem 'delayed_job_active_record'

gem 'daemons'

gem 'rufus-scheduler'

gem 'rswag'
gem 'rswag-api'
gem 'rswag-ui'

gem 'vcr'
gem 'webmock'
gem 'redis'

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'rswag-specs'
end

group :development do
end
