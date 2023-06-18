Rails.application.routes.draw do
  resources :likes
  resources :follow_requests
  resources :comments
  resources :photos
  root "photos#index"
  devise_for :users

end
