
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
  end
end
