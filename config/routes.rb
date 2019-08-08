Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  ###static routes
    #homepage 
  get '/', to: 'static#home' 

  ###sessions routes 
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
    #stackexchange authentication
  get '/auth/:provider/callback', to: 'sessions#create'


  ###app resources 
  resources :users do 
    resources :searches
  end

end
