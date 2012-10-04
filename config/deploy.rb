set :rvm_ruby_string, '1.9.3-p125@likeabouse.com'

require "bundler/capistrano"
require "rvm/capistrano"

set :user, 'wopi'
set :use_sudo, false

set :scm, :git
set :branch, 'master'
set :scm_verbose, true

set :application, "likeabouse"
set :repository,  "git://github.com/likeabouse/likeabouse.com.git"
set :deploy_to, "~/www/likeabouse.com/"

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
