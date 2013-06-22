Postit::Application.routes.draw do
  root to: 'posts#index'
  resources :posts, except: [:destroy] do
    member do
      post 'vote'
    end
    resources :comments, only: [:create] do
      post 'vote', on: :member
    end
  end
  resources :categories, only: [:show, :new, :create]
  resources :users, only: [:show, :create, :edit, :update] do
    member do
      get 'posts'
      get 'comments'
    end
  end
  resources :sessions, only: [:create]

  match '/signup', to: 'users#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
end
