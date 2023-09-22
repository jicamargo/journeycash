Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get "/custom_sign_out" => "devise/sessions#destroy", as: :custom_destroy_user_session
  end

  resources :groups do
    resources :payments
  end
  
  resources :labels
  resources :payments
  
  # root "groups#index"
  root 'static#welcome'

  get '/groups_home', to: 'groups#index', as: 'groups_home'

end
