Rails.application.routes.draw do
  resources :pictures, only: :index
end
