Rails.application.routes.draw do
  devise_for :users
  

  root 'places#index'
  resources :places, only: [:index, :show, :new, :create, :destroy] do
    resources :posts, only: [:index, :new, :create] do
      # resources :images, only: [:create]
    end
    resources :pictures, only: [:index, :show, :new, :create]
  end
end
