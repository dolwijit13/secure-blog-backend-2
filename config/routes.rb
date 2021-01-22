Rails.application.routes.draw do
  post 'comments/add'
  post 'comments/edit'
  post 'posts/add'
  post 'posts/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'users', to: 'user#getUsers'
  get 'users/:id', to: 'user#getUserById'
  post 'users', to: 'user#createUser'

  post 'auth/login', to: 'auth#login'
  
  get 'posts', to: 'posts#show'

  get 'comments', to: 'comments#show'
end
