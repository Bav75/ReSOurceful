Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  ###static routes

  #homepage 
  get '/', to: 'static#home' 

  ###app resources 
  resources :users

end
