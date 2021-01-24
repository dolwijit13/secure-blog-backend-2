Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :create]
  resources :posts, :comments, only: [:update, :index, :create, :destroy]

  post 'auth/login', to: 'auth#login'
end
