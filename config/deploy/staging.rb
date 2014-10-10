role :app, %w{54.172.151.164}
role :web, %w{54.172.151.164}
role :db,  %w{54.172.151.164}

server '54.172.151.164', user: 'ubuntu', roles: %w{mongrel web app}