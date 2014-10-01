lock '3.2.1'

require 'capistrano/maintenance'

set :application, 'gadgets'
set :repo_url, 'git@github.com:wastrox/gadgets.git'
set :rvm_ruby_version, '2.1.2'

set :deploy_to, '/var/www/gadgets-production'
set :linked_dirs, %w{log tmp/pids tmp/cache vendor/bundle public/system}
set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart
end
