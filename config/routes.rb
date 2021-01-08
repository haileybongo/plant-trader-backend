
Rails.application.routes.draw do
  

  namespace :api do
    resources :items
    resources :follows
    resources :comments
    resources :likes
    resources :pictures
    resources :users
    post '/users/:id/follow', to: "users#follow", as: "follow_user"
    post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"
    post '/users/login', to: "users#login", as: "login_user"
    get '/pictures/:id/userpictures', to:  'pictures#userpictures', as: "user_pictures"
  end
end
