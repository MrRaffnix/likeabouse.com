source "https://rubygems.org"

gem 'rails',  '4.0.0'
gem 'mysql2', '0.3.13'

gem 'haml-rails',       '0.4.0'
gem 'jquery-rails',     '3.0.4'
gem 'jquery-ui-rails',  '4.0.4'
gem 'modernizr-rails',  '2.6.2.3'

gem 'kaminari',     '0.14.1'
gem 'activeadmin',  '0.6.0', github: "gregbell/active_admin", branch: "rails4"

gem 'git',      '1.2.6'
# removed in cause of rails4 -- maybe refactor gem or code
# gem 'seed-fu',  '2.2.0' 
gem 'thin',     '1.5.1'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails',   '4.0.0'
  gem 'sass-rails',     '4.0.0'
  gem 'uglifier',       '2.1.2'
  gem "therubyracer",   '0.12.0', require: 'v8'
  gem 'sprite-factory', '1.5.3'
  gem 'chunky_png',     '1.2.8'
end

group :staging, :production do
  gem 'capistrano',             '2.15.5'
  gem 'capistrano-ext',         '1.2.1'
  gem 'cape',                   '1.7.0'
  gem 'capistrano-lazy-assets', '0.0.7'
  gem 'rvm-capistrano',         '1.4.4'

  gem 'unicorn',                '4.6.3'
  gem 'capistrano-unicorn',     '0.1.10', require: false
end

group :development, :test do
  gem 'rspec-rails',        '2.14.0'
  gem 'factory_girl_rails', '4.2.1'
  gem 'ffaker',             '1.18.0'
end

group :development do
  gem 'bundler-audit',        '0.1.2'
  gem 'rails_best_practices', '1.14.1'
  gem 'quiet_assets',         '1.0.2'
end

group :test do
  gem 'simplecov', '0.7.1', require: false
end
