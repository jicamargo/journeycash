Rails.application.routes.draw do
  resources :groups
  resources :payments
  devise_for :users

  root "groups#index"
end
