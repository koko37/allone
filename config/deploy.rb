require 'capistrano/ext/multistage'

lock '3.1.0'

set :application, "ovida"
set :scm, :git
set :repository, "git@bitbucket.org:gototome/ovida.git"
set :scm_passphrase, "mouse1122"
set :user, "dev"

set :stages, ["staging","production"]
set :default_stage, "staging"
