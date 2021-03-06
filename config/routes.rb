Rails.application.routes.draw do
  root 'sessions#new'

  get '/auth/github', :as => 'auth_github'

  get '/auth/github/callback' => 'sessions#create'

  delete 'logout' => 'sessions#destroy', :as => 'logout'

  get '/organizations' => 'organizations#index', :as => 'organizations'

  get '/organizations/:organization' => 'organizations#show', :as => 'organization', :constraints  => { :organization => /[-0-z\._]+/ }

  get '/organizations/:organization/repos/:repo' => 'repos#show', :as => 'repo', :constraints  => { :repo => /[-0-z\._]+/, :organization => /[-0-z\._]+/ }
end
