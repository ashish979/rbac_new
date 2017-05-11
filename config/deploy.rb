# config valid only for current version of Capistrano
lock "3.8.1"

set :application, "tinglado_erp"
set :repo_url, "git@gitlab.com:tinglado/erp.git"

# Default branch is :develop
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/opt/tinglado_apps/erp'

set :user, 'deploy'

set :use_sudo, false
# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :app do
  namespace :server do
    desc 'start the app server'
    task :start do
      on roles(:app) do |h|
        begin
          execute "cd #{fetch :rails_dir} && bundle exec thin start -C config/thin/thin_#{fetch :rails_env}.yml"
          info 'Started Server(s).'
        rescue
          info "Server could not be started on host #{h}"
        end
      end
    end

    desc 'stop the app server'
    task :stop do
      on roles(:app) do |h|
        begin
          execute "cd #{fetch :rails_dir} && bundle exec thin stop -C config/thin/thin_#{fetch :rails_env}.yml"
          info 'Stopped Server(s).'
        rescue
          info "Server was not running on host #{h}"
        end
      end
    end

    desc 'restart the app server'
    task :restart do
      on roles(:app) do |h|
        begin
          execute "cd #{fetch :rails_dir} && bundle exec thin restart -C config/thin/thin_#{fetch :rails_env}.yml"
          info 'restarted Server(s).'
        rescue
          info "Failed to restart app servers on host #{h}"
        end
      end
    end
  end
end

after 'deploy:published', 'app:server:restart'
