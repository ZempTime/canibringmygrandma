set :stage, :production

server '104.236.119.39', user: 'deploy', roles: %w{web app}
