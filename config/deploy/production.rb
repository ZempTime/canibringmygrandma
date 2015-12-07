set :stage, :production

server '104.131.175.130', user: 'deploy', roles: %w{web app}
