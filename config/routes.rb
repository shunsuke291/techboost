Rails.application.routes.draw do
  get 'sessions/new'
  get 'topics/new'
  root 'pages#index'
  get 'pages/help'
  root 'homes#top'
  get 'homes/sitemap'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  resources :topics
  
  get 'favorites/index'
  get 'comment/new'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'
  get '/comments/:topic_id/new', to: 'comments#new', as: 'comments'
  post '/comments/:topic_id/create', to: 'comments#create', as:'comments_create'
  delete 'topics/:id' => 'favorites#destroy'
    resources :comments, only: [:create, :destroy]
end