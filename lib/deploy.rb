set :application, "knightirrigation.com"
set :user, "root" # I used root, less problems, but not recommended.
 
set :scm, :git
set :sudo, false
default_run_options[:pty] = true
 
# This distinction is necessary if the way you access github locally
# is different from the way your production environment will access it.
# For me it was the case.
#set :local_repository, "git@github.com:jwo/KnightIrrigation.com.git"
set :repository, "git@github.com:jwo/KnightIrrigation.com.git"
 
set :deploy_to, "/u/apps/knightirrigation.com" # path to app on remote machine
set :deploy_via, :remote_cache # quicker checkouts from github
 
set :domain, 'knightirrigation.com' # your remote machine's domain name goes here
role :app, "knightirrigation.com"
role :web, "knightirrigation.com"
 
set :runner, user
set :admin_runner, runner
 
namespace :deploy do
  task :start, :roles => [:web, :app] do
    deploy.start
  end
  
  task :restart, :roles => [:web, :app] do    
    run "touch #{deploy_to}/current/restart.txt"
  end
  
  task :update, :roles => [:web, :app] do
    deploy.restart
  end
 
  # This will make sure that Capistrano doesn't try to run rake:migrate (this is not a Rails project!)
  task :cold do
    deploy.update
    deploy.start
  end
end