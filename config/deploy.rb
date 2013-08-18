set :stages, %w(staging production)
set :default_stage, "staging"

require 'capistrano/ext/multistage'
require 'capistrano-lazy-assets'

set :scm, :git
set :scm_verbose, true
set :repository,  "git://github.com/likeabouse/likeabouse.com.git"

set :user, "angelo"
set :use_sudo, false

set :keep_releases, 3

namespace :deploy do
  desc "Symlinks the database.yml"
  task :symlink_db, :roles => :app do
    run "ln -nfs #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
  end
end

after 'deploy:update_code', 'deploy:symlink_db'
after 'deploy:restart', 'unicorn:restart'

