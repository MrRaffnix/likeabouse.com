source "https://rubygems.org"

gem 'rails',  '3.2.13'
gem 'mysql2', '0.3.11'

gem 'haml-rails',       '0.4.0'
gem 'jquery-rails',     '2.2.1'
gem 'jquery-ui-rails',  '4.0.2'
gem 'modernizr-rails',  '2.6.2.1'

gem 'kaminari',     '0.14.1'
gem 'activeadmin',  '0.6.0'

gem 'git',      '1.2.5'
gem 'seed-fu',  '2.2.0'
gem 'thin',     '1.5.1'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails',   '3.2.2'
  gem 'sass-rails',     '3.2.6'
  gem 'uglifier',       '2.0.1'
  gem "therubyracer",   '0.11.4', require: 'v8'
  gem 'sprite-factory', '1.5.3'
  gem 'chunky_png',     '1.2.8'
end

group :staging, :production do
  gem 'capistrano',             '3.0.1'
  gem 'cape',                   '1.7.0'
  gem 'capistrano-lazy-assets', '0.0.7'
  gem 'puma'
end

group :development, :test do
  gem 'rspec-rails',        '2.13.0'
  gem 'factory_girl_rails', '4.2.1'
  gem 'ffaker',             '1.15.0'
  gem 'sqlite3'
end

group :development do
  gem 'bundler-audit',        '0.1.2'
  gem 'rails_best_practices', '1.13.4'
  gem 'quiet_assets',         '1.0.2'
end

group :test do
  gem 'simplecov', '0.7.1', require: false
end
