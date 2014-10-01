role :app, %w{gadgets.kosachov.com}
role :web, %w{gadgets.kosachov.com}
role :db,  %w{gadgets.kosachov.com}

server 'gadgets.kosachov.com', user: 'mongrel', roles: %w{mongrel web app}