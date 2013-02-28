set :application, "likeabouse"
# =============================================================================
# MULTISTAGE CONFIGURATION (see config/deploy/foobar.rb)
# =============================================================================
set :stages, %w(staging production)
require 'capistrano/ext/multistage'
require "bundler/capistrano"
require "rvm/capistrano"
require "capistrano-unicorn"

set :default_stage, "staging"
#############################################################
#    Settings
#############################################################
set :user, 'angelo'
set :use_sudo, false

set :rvm_ruby_string, '2.0.0-p0@likeabouse.com'
set :bundle_without, %w(development test)

set :scm, :git
set :scm_verbose, true
set :application, "likeabouse"
set :repository,  "git://github.com/likeabouse/likeabouse.com.git"

set :branch do
  default_tag = `git tag`.split("\n").last

  tag = Capistrano::CLI.ui.ask "Tag to deploy (make sure to push the tag first): [#{default_tag}] "
  tag = default_tag if tag.empty?
  tag
end

set :keep_releases, 20

#############################################################
#    Additional Capistrano Tasks
#############################################################
namespace :deploy do
  desc "Symlinks the database.yml"
  task :create_symlinks, :roles => :app do
    run "ln -nfs #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
  end
end

#############################################################
#    Hooks
#############################################################
# after 'deploy', 'deploy:assets:precompile'
# before 'deploy:assets:precompile', 'deploy:symlink_db'