set :stage, :production

set :rbenv_ruby, "2.1.5"

role :app, %w{angelo@charlie.bashman.org}
role :web, %w{angelo@charlie.bashman.org}
role :db,  %w{angelo@charlie.bashman.org}
