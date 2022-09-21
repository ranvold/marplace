source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem 'rails', '~> 7.0', '>= 7.0.4'
gem 'sprockets-rails', '~> 3.4', '>= 3.4.2'
gem 'pg', '~> 1.4', '>= 1.4.3'
gem 'puma', '~> 5.6', '>= 5.6.5'
gem 'jsbundling-rails', '~> 1.0', '>= 1.0.3'
gem 'cssbundling-rails', '~> 1.1', '>= 1.1.1'
gem 'haml-rails', '~> 2.0', '>= 2.0.1'
gem 'devise', '~> 4.8', '>= 4.8.1'
gem 'kaminari', '~> 1.2', '>= 1.2.2'
gem 'image_processing', '~> 1.12', '>= 1.12.2'

group :development, :test do
  gem 'debug', '~> 1.6', '>= 1.6.2', platforms: %i[ mri mingw x64_mingw ]
  gem 'rspec-rails', '~> 5.1', '>= 5.1.2'
end

group :development do
  gem 'web-console', '~> 4.2'
  gem 'letter_opener', '~> 1.8', '>= 1.8.1'
end