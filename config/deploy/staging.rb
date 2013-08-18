set :rails_env, "staging"
set :branch do
  default_branch = 'develop'

  tag = Capistrano::CLI.ui.ask "branch or tag to deploy?: [#{default_branch}] "
  tag = default_branch if tag.empty?
  tag
end

require "rvm/capistrano"
set :rvm_ruby_string, '2.0.0-p0@likeabouse.com'

role :web, "beta.bashman.org"

set :application, "staging.likeabouse.com"

set :deploy_to, "/home/angelo/www/#{application}/"

require "capistrano-unicorn"
after 'deploy:update_code', 'deploy:symlink_db'
after 'deploy:restart', 'unicorn:restart'
