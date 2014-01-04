set :stage, :production

set :rbenv_ruby, "2.0.0-p0"

role :app, %w{angelo@alpha.bashman.org}
role :web, %w{angelo@alpha.bashman.org}
role :db,  %w{angelo@alpha.bashman.org}
