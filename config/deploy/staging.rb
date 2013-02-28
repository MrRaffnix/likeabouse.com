set :deploy_to, "/home/angelo/www/redesign.likeabouse.com/"

role :web, "bashman.org"
role :app, "bashman.org"
role :db,  "bashman.org", :primary => true
