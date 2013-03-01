set :rails_env, "staging"
set :branch,    "redesign"
set :application, "redesign.likeabouse.com"

set :deploy_to, "/home/angelo/www/#{application}/"

namespace :deploy do
  desc "Symlinks the database.yml"
  task :symlink_db, :roles => :app do
    run "ln -nfs #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
  end
end

require "capistrano-unicorn"
