
Rails.application.routes.draw do
  
  namespace :api do
    resources :items

  end
end
