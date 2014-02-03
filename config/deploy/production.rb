set :stage, :production
set :branch, :master

server "allone-solution.net", user: 'dev', roles: %w{:app, :web, :db}, :primary => true, :password=>'mouse1122'
set :deploy_to, "/home/dev/app/allone/ovida"

set :rails_env, :production
