role :web, "bashman.org"
role :app, "bashman.org"
role :db,  "bashman.org", :primary => true

set :deploy_to, "/home/angelo/www/likeabouse.com/"
set :rails_env, "production"
set :user,    'angelo'
set :use_sudo, false