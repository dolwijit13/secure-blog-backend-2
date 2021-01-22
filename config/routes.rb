Rails.application.routes.draw do
  get 'auths/login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'users', to: 'user#getUsers'
  get 'users/:id', to: 'user#getUserById'
  post 'users', to: 'user#createUser'
  post 'auth/login', to: 'auth#login'
end
