set :rails_env, "production"
set :branch do
  default_branch = 'master'

  tag = Capistrano::CLI.ui.ask "branch or tag to deploy?: [#{default_branch}] "
  tag = default_branch if tag.empty?
  tag
end

role :app, "alpha.bashman.org"
role :web, "alpha.bashman.org"

set :application, "likeabouse.com"

set :deploy_to, "/home/angelo/www/#{application}/"

require "bundler/capistrano"
set :bundle_flags, "--deployment --quiet --binstubs"
set :bundle_without, %w(development test)

set :default_environment, {
  'PATH' => "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
}

require "capistrano-unicorn"
after 'deploy:update_code', 'deploy:symlink_db'
after 'deploy:restart', 'unicorn:restart'
