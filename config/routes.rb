Rails.application.routes.draw do

  root "photos#index"

  #get "/user/:id" => "users#show", as: :user:
  
  devise_for :users

  resources :likes
  resources :follow_requests
  resources :comments
  resources :photos
  #resources :users, only: :show
  

  get ":username/liked" => "photos#liked", as: :liked_photos
  #get ":username/feed" => "photos#feed", as: :liked_photos

  #get ":username/followers" => "photos#followers", as: :followers_photos
  #get ":username/follwing" => "photos#follwing", as: :following_photos


  get ":username" => "users#show", as: :user
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
