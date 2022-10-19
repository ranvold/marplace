source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
ruby '3.1.2'

gem 'rails', '7.0.4'

gem 'pg',              '1.4.3'
gem 'puma',            '5.6.5'
gem 'sprockets-rails', '3.4.2'

gem 'cssbundling-rails', '1.1.1'
gem 'haml-rails',        '2.0.1'
gem 'jsbundling-rails',  '1.0.3'

gem 'activeadmin', '2.13.1'
gem 'devise',      '4.8.1'

gem 'bootstrap5-kaminari-views', '0.0.1'
gem 'kaminari',                  '1.2.2'

gem 'image_processing', '1.12.2'

gem 'grape', '1.6.2'

gem 'chartkick', '4.2.1'

gem 'opensearch-ruby', '2.0.3'
gem 'searchkick',      '5.0.5'

gem 'redis', '5.0.5'

group :development, :test do
  gem 'debug',         '1.6.2', platforms: %i[mri mingw x64_mingw]
  gem 'rubocop',       '1.36.0', require: false
  gem 'rubocop-rails', '2.16.1', require: false
  gem 'rubocop-rspec', '2.13.2', require: false
end

group :development do
  gem 'letter_opener',  '1.8.1'
  gem 'web-console',    '4.2.0'
end

group :test do
  gem 'capybara',          '3.37.1'
  gem 'rspec-rails',       '6.0'

  gem 'factory_bot_rails', '6.2.0'
  gem 'faker',             '2.23'

  gem 'shoulda-matchers',  '5.2'
end
