set :rvm_ruby_string, '2.0.0-p0@likeabouse.com'
require "bundler/capistrano"
require "rvm/capistrano"

set :user, 'angelo'
set :use_sudo, false

set :scm, :git
set :branch, 'redesign'
set :scm_verbose, true

set :application, "redesign.likeabouse"
set :repository,  "git://github.com/likeabouse/likeabouse.com.git"
set :deploy_to, "~/www/redesign.likeabouse.com/"

role :web, "bashman.org"
role :app, "bashman.org"
role :db,  "bashman.org", :primary => true

after 'deploy:update_code', 'deploy:symlink_db'

namespace :deploy do
  desc "Symlinks the database.yml"
  task :symlink_db, :roles => :app do
    run "ln -nfs #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
  end
end

require "capistrano-unicorn"
