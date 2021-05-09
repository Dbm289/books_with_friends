Rails.application.routes.draw do
  resources :reviews
  root 'sessions#home'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get 'users/:id', to: 'users#show', as: "user"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/auth/facebook/callback', to: 'sessions#fbcreate'
  resources :books
  #resources :users, only [:show, :index] do
   # resources :reviews, only: [:show, :index, :new, :edit]
  #end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
