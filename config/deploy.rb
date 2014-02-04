require 'capistrano/ext/multistage'

default_run_options[:pty]= true

require 'rvm/capistrano'
set :rvm_ruby_string, '1.9.3-p484'
set :rvm_type, :user

set :application, "Ovida"

set :repository,  "git@bitbucket.org:gototome/ovida.git"
set :scm, :git
set :scm_verbose, true

set :user, "dev"
set :ssh_options, {:keys=>%w(~/.ssh/allone), :forward_agent => true}
set :use_sudo, false
set :deploy_via, :remote_cache

set :keep_releases, 5

set :stages, ["staging","production"]
set :default_stage, "staging"
#set :deploy_via, :remote_cache

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`


#role :app, "your app-server here"                          # This may be the same as your `Web` server
#role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
after "deploy:update_code", :bundle_install


task :bundle_install do
  run "cd #{current_path}; bundle install"
end

namespace :deploy do
  desc "cause Passenger to initiate a restart"
  task :restart, :roles => :web do
    run "touch #{current_path}/tmp/restart.txt"
  end
  
  task :restart_daemons, :roles => :app do
    sudo "monit restart all -g daemons"
  end
end



