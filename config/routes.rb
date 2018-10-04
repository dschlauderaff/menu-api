Rails.application.routes.draw do
  post 'login', to: 'sessions#login'
  namespace :api do
    resources :secrets, only: :index
    resources :users, only: [:index, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
