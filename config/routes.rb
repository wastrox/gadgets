Rails.application.routes.draw do

  root 'home#index'
  devise_for :users, :controllers => { :sessions => "devise/sessions" }, path: "/", path_names: { sign_in: 'login', sign_out: 'logout', password: 'recovery', cancel: 'unregister', edit: 'profile' }

  resources :gadgets do
    resources :photos
  end

  # search alias for index action of gadgets controller for :post-ing search form
  get 'search', to: 'gadgets#index' 
  
end
