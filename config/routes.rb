Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:edit, :update]
  

  root 'places#index'
  resources :places, only: [:index, :show, :new, :create, :destroy] do
    resources :posts, only: [:index, :new, :create] 
    resources :pictures, only: [:index, :show, :new, :create]
  end
  resources :tags do
    collection do
      get 'search'
    end
  end
end
