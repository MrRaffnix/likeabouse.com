set :rails_env, "staging"
set :branch do
  default_branch = 'develop'

  tag = Capistrano::CLI.ui.ask "branch or tag to deploy?: [#{default_branch}] "
  tag = default_branch if tag.empty?
  tag
end
set :application, "redesign.likeabouse.com"

set :deploy_to, "/home/angelo/www/#{application}/"

namespace :deploy do
  desc "Symlinks the database.yml"
  task :symlink_db, :roles => :app do
    run "ln -nfs #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
  end
end

require "capistrano-unicorn"
after 'deploy:restart', 'unicorn:restart'