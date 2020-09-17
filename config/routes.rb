Rails.application.routes.draw do
  root 'chatroom#index'
  get '/login' => 'sessions#new', as: 'new_session'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
