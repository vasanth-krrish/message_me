Rails.application.routes.draw do

  root 'messages#index'

  get '/login' => 'sessions#new', as: 'login'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy', as: 'logout'

  get '/signup' => 'users#new', as: 'signup'
  post '/signup' => 'users#create'

  post '/message' => 'messages#create', as: 'message'

  mount ActionCable.server, at: '/cable'

end
