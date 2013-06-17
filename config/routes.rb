Postit::Application.routes.draw do
  root to: 'posts#index'
  resources :posts, except: [:destroy] do
    resources :comments, only: [:create]
  end
  resources :categories, only: [:show, :new, :create]
  resources :users, only: [:show, :create]
  resources :sessions, only: [:create]

  match '/signup', to: 'users#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
end
