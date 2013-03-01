set :stages, %w(staging production)
set :default_stage, "staging"
require 'capistrano/ext/multistage'
require 'capistrano-lazy-assets'

set :application, "likeabouse"

require "rvm/capistrano"
set :rvm_ruby_string, '2.0.0-p0@likeabouse.com'
require "bundler/capistrano"
set :bundle_without, %w(development test)

set :scm, :git
set :scm_verbose, true
set :repository,  "git://github.com/likeabouse/likeabouse.com.git"
#set :repository,  "git@github.com:astropanic/likeabouse.com.git"

role :web, "bashman.org"
role :app, "bashman.org"
role :db,  "bashman.org", :primary => true

set :user, "angelo"
set :use_sudo, false

set :keep_releases, 20

after 'deploy:update_code', 'deploy:symlink_db'

