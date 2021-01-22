Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'users', to: 'user#getUsers'
  get 'users/:id', to: 'user#getUserById'
  post 'users', to: 'user#createUser'

  post 'auth/login', to: 'auth#login'
  
  get 'posts', to: 'posts#show'
  post 'posts', to: 'posts#add'
  post 'posts/:id', to: 'posts#edit'
  delete 'posts/:id', to: 'posts#delete'

  get 'comments', to: 'comments#show'
  post 'comments', to: 'comments#add'
  post 'comments/:id', to: 'comments#edit'
  delete 'comments/:id', to: 'comments#delete'
end
