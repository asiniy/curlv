Rails.application.routes.draw do
  root 'downloads#index'
  resources :downloads, only: [:create, :show]
end
