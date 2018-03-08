Rails.application.routes.draw do
  resources :decks
  # resources :categories
  resources :scores
  resources :cards
  root 'page#index'
  get '/facebook' => 'facebook#token'

  get '/secret' => 'page#secret'

  get '/register' => 'users#new'

  resources :users do
    resources :decks
  end

  get 'auth/:provider/callback' => 'sessions#create'
  post 'auth/:provider/callback' => 'sessions#create'
  # get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :page, only: [:show]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :categories do
  resources :decks
end

  resources :decks do
    resources :cards
  end
end
