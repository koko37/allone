lock '3.1.0'

set :application, "ovida"
set :deploy_user, "dev"

set :scm, :git
set :scm_password, "mouse1122"

set :repo_url, "git@bitbucket.org:gototome/ovida.git"

#set :rbenv_type, :system
#set :rbenv_ruby, '1.9.3p484'

set :keep_releases, 5

set :linked_files, %w{config/database.yml}

namespace :deploy do

end
