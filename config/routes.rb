Rails.application.routes.draw do
  root to: 'places#index'
  resources :places, only: [:index, :show, :new, :create, :destroy] do
    resources :posts, only: [:index, :new, :create] do
      # resources :images, only: [:create]
    end
    resources :pictures, only: [:index, :show, :new, :create]
  end
end
